function data = str2bit(varargin)
%�ַ���ת����������
% ���룺�ַ���
% ���������������


source = '';                        %#ok<NASGU>
str = '';

if nargin == 0                      % nargin Ϊ��������ĸ���
	source = input('please enter the plain text you want to send:\n', 's');
else
    source = varargin{1};           % varargin�䳤��������Ϊ���������һ�����壬���ڻ������Ĳ���
end

source_len = length(source) * 8;    % ����λ����
data = zeros(1, source_len);        % ��ʼ��������λ����

for n = 1 : length(source)
    temp = dec2bin(source(n), 8);   % �����ַ�ASCIIתΪ8λ��������
    str = strcat(str, temp);        % ���ӵ��ַ�����
end
                                    % �ַ���0/1תΪ������0/1
for n = 1 : source_len
    if str(n) == '0'
        data(n) = 0; 
    elseif str(n) == '1'
        data(n) = 1;
    else
        fprintf(1, 'error bit');
        return
    end
end

end