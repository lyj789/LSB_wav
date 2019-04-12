function data = str2bit(varargin)
%字符串转二进制数组
% 输入：字符串
% 输出：二进制数组


source = '';                        %#ok<NASGU>
str = '';

if nargin == 0                      % nargin 为输入参数的个数
	source = input('please enter the plain text you want to send:\n', 's');
else
    source = varargin{1};           % varargin变长参数，作为参数的最后一个定义，用于获得任意的参数
end

source_len = length(source) * 8;    % 比特位长度
data = zeros(1, source_len);        % 初始化二进制位长度

for n = 1 : length(source)
    temp = dec2bin(source(n), 8);   % 单个字符ASCII转为8位二进制数
    str = strcat(str, temp);        % 附加到字符串中
end
                                    % 字符串0/1转为二进制0/1
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