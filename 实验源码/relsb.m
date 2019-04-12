fid = fopen('2_water.wav' ,'rb');
a=fread(fid,inf,'uchar');
n=length(a)-44;
fclose(fid);

re=[];
for i=1:n
   re=[re;bitget(a(i+44),1)];
end

for i=1:n
    if re(i)==1
        start=i
        break;
    end
end

for i=1:n/start-1
    se(i)=re(start*(i+1));
end

fid=fopen('serect.txt','wt');
for i=1:floor(length(se)/8)
    b=num2str(se(1+(i-1)*8:8+(i-1)*8));
    c=bin2dec(b);
    d=char(c);
   fprintf(fid,'%s',d);
end
fclose(fid);

