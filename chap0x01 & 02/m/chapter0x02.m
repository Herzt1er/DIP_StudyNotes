% f = imread('Fig0203(a)(chest-xray).tif');
% % whos f;
% % ��ȡͼƬ�ߴ�
% imgSize = size(f);
% imgWidth = imgSize(2);
% imgHeight = imgSize(1);
% % ���ע��
% x = imgWidth / 2; % ע�Ϳ����ĵ�� x ����
% y = imgHeight + 50; % ע�Ϳ����ĵ�� y ���꣨ͼƬ�·�����һ����ࣩ
% 
% subplot(1,2,1);
% imshow(f);
% str = '(a)���춯̬��Χǰ��ͼ��f'; % ע���ı�����
% text(x, y, str, 'Color', 'black', 'FontSize', 10, 'HorizontalAlignment', 'center');
% 
% subplot(1,2,2);
% imshow(f,[]);
% str = '(b)���춯̬��Χ���ͼ��f'; % ע���ı�����
% text(x, y, str, 'Color', 'black', 'FontSize', 10, 'HorizontalAlignment', 'center');
% 
% f = imread('Fig0203(a)(chest-xray).tif');
% % whos f;
% % ��ȡͼƬ�ߴ�
% imgSize = size(f);
% imgWidth = imgSize(2);
% imgHeight = imgSize(1);
% % ���ע��
% x = imgWidth / 2; % ע�Ϳ����ĵ�� x ����
% y = imgHeight + 50; % ע�Ϳ����ĵ�� y ���꣨ͼƬ�·�����һ����ࣩ
% 
% subplot(1,2,1);
% imshow(f);
% str = '(a)���춯̬��Χǰ��ͼ��f'; % ע���ı�����
% text(x, y, str, 'Color', 'black', 'FontSize', 10, 'HorizontalAlignment', 'center');
% 
% subplot(1,2,2);
% imshow(f,[]);
% str = '(b)���춯̬��Χ���ͼ��f'; % ע���ı�����
% text(x, y, str, 'Color', 'black', 'FontSize', 10, 'HorizontalAlignment', 'center');
% 
% % ����ע��
% str = '�����ڴ������·���ע��';
% annotation('textbox', 'Position', [0.5, 0.025, 0.1, 0.05], 'String', str, 'FitBoxToText', 'on', 'HorizontalAlignment', 'center');
% ��ȡԭʼͼ��

% img = imread('Fig0204(a)(bubbles-q-100jpg).tif');
% 
% % ���ò�ͬ��ѹ����������
% qualities = [100,50,25,15,5,0];
% 
% for i = 1:numel(qualities)
%     % ���챣���ļ���
%     filename = sprintf('compressed_image_q%d.jpg', qualities(i));
%     
%     % ѹ��ͼ�񲢱���
%     imwrite(img, filename, 'jpg', 'Quality', qualities(i));
%     
%     K = imfinfo(filename);
%     image_bytes = K.Width*K.Height*K.BitDepth/8;
%     compressed_bytes = K.FileSize;
%     compression_ratio = image_bytes/compressed_bytes;
%     % ��ʾѹ�����
%     subplot(2, 3, i);
%     imshow(filename);
%     title(['ѹ���ȣ�', num2str(compression_ratio)]);
% end

% filename = 'Fig0205(a)(cktboard_200dpi).tif';

% 
% % ��ȡԭʼͼ��ķֱ��ʺͳߴ�
% original_info = imfinfo(filename);
% original_resolution = [original_info.Width, original_info.Height];
% size1 = [original_info.XResolution, original_info.YResolution];
% 

% res1 = round(200*2.25/1.5);
% 
% f = imread(filename);
% subplot(1,2,1)
% imshow(f)
% axis tight;
% 
% imwrite(f,'sf.tif','compression','none','resolution',res1);
% subplot(1,2,2)
% imshow(f)
% axis tight;

% imwrite(f,'cktboard_300dpi.tif','compression','none','resolution',res);
% subplot(1,3,3)
% imshow(f, 'InitialMagnification', 'fit')


% ��ȡ��һ��ͼƬ����ȡ��Ϣ
% f = imread('Fig0205(a)(cktboard_200dpi).tif');
% info1 = imfinfo('Fig0205(a)(cktboard_200dpi).tif');
% size1 = [info1.Width, info1.Height];
% dpi1 = [info1.XResolution,info1.YResolution];  % ��ȡ��һ��ͼƬ��DPI
% 
% % ������ʾ���ڵĴ�С
% figure('Units', 'pixels', 'Position', [100, 100, 700, 300]);
% 
% % ��ʾ��һ��ͼƬ
% subplot('Position', [0.1, 0.1, size1(1)/dpi1(1)*100/700, size1(2)/dpi1(2)*100/300]);
% imshow(f);
% title(['Image 1 (',  num2str(dpi1(1)), '��', num2str(dpi1(2)), ' DPI)']);
% 
% % ����ѹ������
% target_inch = [1.5,1.5];
% res = [round(info1.Width/target_inch(1)),round(info1.Height/target_inch(2))];
% imwrite(f,'sf.tif','compression','none','resolution',res);
% 
% info2 = imfinfo('sf.tif');
% size2 = [info2.Width, info2.Height];
% dpi2 = [info2.XResolution,info2.YResolution];  % ��ȡ�ڶ���ͼƬ��DPI
% % ��ʾ�ڶ���ͼƬ
% subplot('Position', [0.6, 0.1, size2(1)/dpi2(1)*100/700, size2(2)/dpi2(2)*100/300]);
% imshow(f);
% title(['Image 2 (', num2str(dpi2(1)), '��', num2str(dpi2(2)),' DPI)']);
% 
% f = imread('Fig0206(a)(rose-original).tif');
% subplot(3,2,1),imshow(f),title('(a)ԭͼ��')
% % ��ֱ��תͼ��
% fp = f(end:-1:1,:);subplot(3,2,2)
% imshow(fp),title('(b)��ֱ��תͼ��')
% % ��ȡ����ͼ��
% h_st = 257;h_ed = 768;
% w_st = 268;w_ed = 757;
% fc = f(h_st:h_ed,w_st:w_ed);subplot(3,2,3)
% imshow(fc),title('(c)��ȡ����ͼ��')
% % ����ȡ��ͼ��
% step = 20;fs = f(1:step:end,1:step:end);
% subplot(3,2,4),imshow(fs),title('(d)����ȡ��ͼ��')
% % ͨ��ͼ���в���ˮƽɨ����
% col = 512;subplot(3,2,[5 6])
% plot(f(size(f,1)/2,:)),title('(e)ͨ��ͼ���в���ˮƽɨ����')

[rt1,rt2, f1,f2,g,t1,t2,t3] = twodsin(1,1/(4*pi),1/(4*pi),512,512);
f1 = mat2gray(f1);subplot(1,3,1),imshow(f1)
title(['(a)δԤ��������:',num2str(t1),'s'])
f2 = mat2gray(f2);subplot(1,3,2),imshow(f2)
title(['(b)Ԥ��������:', num2str(t2),'s'])
g = mat2gray(g);subplot(1,3,3),imshow(g)
title(['(c)����ѭ��:', num2str(t3),'s'])
annotation('textbox', [0.45, 0.25, 0.1, 0.1], 'String', ['��(a)(c)������ѭ����û��Ԥ��������� for ѭ������ ' num2str(rt1) ' ��'], 'HorizontalAlignment', 'center', 'EdgeColor', 'none');
annotation('textbox', [0.45, 0.2, 0.1, 0.1], 'String', ['��(b)(c)������ѭ������Ԥ��������� for ѭ������ ' num2str(rt2) ' ��'], 'HorizontalAlignment', 'center', 'EdgeColor', 'none');