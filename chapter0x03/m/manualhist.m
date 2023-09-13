% ���� manualhist ����
function p = manualhist
% ��ʼ�� repeats Ϊ���Կ���ѭ��
repeats = true;
% �����˳��ַ� 'x'
quitnow = 'x';
% ʹ�ó�ʼ��˹���ģ�ͳ�ʼ�� p
p = twomodegauss(0.15, 0.05, 0.75, 0.05, 1, 0.07, 0.002);

% ��ʼ����ѭ��
while repeats
    % ��ʾ�û�����ֵ������ 'x' �˳�
    s = input('������ m1��sig1��m2��sig2��A1��A2��k �� x �˳�:', 's');
    % ��������Ƿ�Ϊ 'x' ���˳�ѭ��
    if s == quitnow
        break
    end
    % �������ַ���ת��Ϊ��������
    v = str2num(s);
    % ��������Ƿ���� 7 ������ֵ
    if numel(v) ~= 7
        disp('������������ȷ��')
        continue
    end
    % �����û�������� p �ĸ�˹���ģ��
    p = twomodegauss(v(1), v(2), v(3), v(4), v(5), v(6), v(7));
    % ������ͼ�β����Ƹ��µĸ�˹���ģ��
    figure, plot(p)
    xlim([0 255])
end
