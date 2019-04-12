[s,fs]=audioread('2.wav');
[row,col]=size(s);
if(row>col)
    s=s';
end;
fid=fopen('echo.txt','r');
[msg,count]=fread(fid);
msg=str2bit(msg);
msg=uint8(msg)';
lend=length(msg);

len=length(s);
fragment=8;
N=floor(len/fragment);

atten=0.9;
m0=100;
m1=200;
s0=atten*[zeros(1,m0),s(1:len-m0)];
s1=atten*[zeros(1,m1),s(1:len-m1)];

o=s0;                   %假设回声音频都是m0偏移（后面再调整）
for i=1:N               %一帧隐藏一位
    if(i>lend)          %多余的帧隐藏0
        bit=0;
    else
        bit=msg(i);
    end
    if bit==1           %待隐藏的消息比特是1，偏移量是m1
        st=(i-1)*fragment+1;
        ed=i*fragment;
        o(st:ed)=s1(st:ed);
    end
end
o=s+o;
%x=0:len-1;
figure;
plot(x,o,x,s);
audiowrite('2_echo.wav',o,fs);

    
        
