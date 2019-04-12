[in,fs]=audioread('2_echo.wav');
[row,col]=size(in);
if(row>col)
    in=in';
end
fragment=56;
fft_len=0;
d0=8;
d1=12;
i=0;
out=[];
N=floor(length(in)/fragment);

for i=1:N               %每一帧进行fft变换
    st=(i-1)*fragment+1;
    ed=i*fragment;
    p=in(st:ed);
    p=fft(p);           %倒谱
    if p~=0
        p=ifft(log(abs(p)));
    end
    p=abs(p);
    d01=p(d0+1);
    d11=p(d1+1);
    if d11 > d01
        out(i)=1;
    else
        out(i)=0;
    end
end
out=out';
w=out(1:32);
fid=fopen('reechoded.txt','wt');
for i=1:4
    b=num2str(out(1+(i-1)*8:8+(i-1)*8));
    c=bin2dec(b');
    d=char(c);
    fprintf(fid,'%s',d);
end
fclose(fid);
