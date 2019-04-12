fid = fopen('2.wav' ,'rb');
a=fread(fid,inf,'uchar');
n=length(a)-44;
fclose(fid);

allpath = 'message.txt';
fid = fopen(allpath);
data = textscan(fid,'%s');   
d=vertcat(data{:});  
q=cell2mat(d);      %cell转化为数组
p=dec2bin(q,8);     %10进制转8位2进制
pp=p';              %转置
y=pp(:);            %变成一维的
fclose(fid);


water=a;
for i=1:length(a)-44
    water(44+i)=bitset(water(44+i),1,0);
end

start=randi(floor(n/(length(y)+1)),1,1);
water(44+start)=1;
for i=1:length(y)
    water(44+(i+1)*start)=bitset(water(44+(i+1)*start),1,str2double(y(i)));
end

fid=fopen('2_water.wav','wb');
fwrite(fid,water,'uchar');
fclose(fid);




