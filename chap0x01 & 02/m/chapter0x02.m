% f = imread('Fig0203(a)(chest-xray).tif');
% % whos f;
% % 获取图片尺寸
% imgSize = size(f);
% imgWidth = imgSize(2);
% imgHeight = imgSize(1);
% % 添加注释
% x = imgWidth / 2; % 注释框中心点的 x 坐标
% y = imgHeight + 50; % 注释框中心点的 y 坐标（图片下方留出一定间距）
% 
% subplot(1,2,1);
% imshow(f);
% str = '(a)拉伸动态范围前的图像f'; % 注释文本内容
% text(x, y, str, 'Color', 'black', 'FontSize', 10, 'HorizontalAlignment', 'center');
% 
% subplot(1,2,2);
% imshow(f,[]);
% str = '(b)拉伸动态范围后的图像f'; % 注释文本内容
% text(x, y, str, 'Color', 'black', 'FontSize', 10, 'HorizontalAlignment', 'center');
% 
% f = imread('Fig0203(a)(chest-xray).tif');
% % whos f;
% % 获取图片尺寸
% imgSize = size(f);
% imgWidth = imgSize(2);
% imgHeight = imgSize(1);
% % 添加注释
% x = imgWidth / 2; % 注释框中心点的 x 坐标
% y = imgHeight + 50; % 注释框中心点的 y 坐标（图片下方留出一定间距）
% 
% subplot(1,2,1);
% imshow(f);
% str = '(a)拉伸动态范围前的图像f'; % 注释文本内容
% text(x, y, str, 'Color', 'black', 'FontSize', 10, 'HorizontalAlignment', 'center');
% 
% subplot(1,2,2);
% imshow(f,[]);
% str = '(b)拉伸动态范围后的图像f'; % 注释文本内容
% text(x, y, str, 'Color', 'black', 'FontSize', 10, 'HorizontalAlignment', 'center');
% 
% % 创建注释
% str = '这是在窗口正下方的注释';
% annotation('textbox', 'Position', [0.5, 0.025, 0.1, 0.05], 'String', str, 'FitBoxToText', 'on', 'HorizontalAlignment', 'center');
% 读取原始图像

% img = imread('Fig0204(a)(bubbles-q-100jpg).tif');
% 
% % 设置不同的压缩质量参数
% qualities = [100,50,25,15,5,0];
% 
% for i = 1:numel(qualities)
%     % 构造保存文件名
%     filename = sprintf('compressed_image_q%d.jpg', qualities(i));
%     
%     % 压缩图像并保存
%     imwrite(img, filename, 'jpg', 'Quality', qualities(i));
%     
%     K = imfinfo(filename);
%     image_bytes = K.Width*K.Height*K.BitDepth/8;
%     compressed_bytes = K.FileSize;
%     compression_ratio = image_bytes/compressed_bytes;
%     % 显示压缩结果
%     subplot(2, 3, i);
%     imshow(filename);
%     title(['压缩比：', num2str(compression_ratio)]);
% end

% filename = 'Fig0205(a)(cktboard_200dpi).tif';

% 
% % 获取原始图像的分辨率和尺寸
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


% 读取第一张图片并获取信息
% f = imread('Fig0205(a)(cktboard_200dpi).tif');
% info1 = imfinfo('Fig0205(a)(cktboard_200dpi).tif');
% size1 = [info1.Width, info1.Height];
% dpi1 = [info1.XResolution,info1.YResolution];  % 获取第一张图片的DPI
% 
% % 设置显示窗口的大小
% figure('Units', 'pixels', 'Position', [100, 100, 700, 300]);
% 
% % 显示第一张图片
% subplot('Position', [0.1, 0.1, size1(1)/dpi1(1)*100/700, size1(2)/dpi1(2)*100/300]);
% imshow(f);
% title(['Image 1 (',  num2str(dpi1(1)), '×', num2str(dpi1(2)), ' DPI)']);
% 
% % 构造压缩向量
% target_inch = [1.5,1.5];
% res = [round(info1.Width/target_inch(1)),round(info1.Height/target_inch(2))];
% imwrite(f,'sf.tif','compression','none','resolution',res);
% 
% info2 = imfinfo('sf.tif');
% size2 = [info2.Width, info2.Height];
% dpi2 = [info2.XResolution,info2.YResolution];  % 获取第二张图片的DPI
% % 显示第二张图片
% subplot('Position', [0.6, 0.1, size2(1)/dpi2(1)*100/700, size2(2)/dpi2(2)*100/300]);
% imshow(f);
% title(['Image 2 (', num2str(dpi2(1)), '×', num2str(dpi2(2)),' DPI)']);
% 
% f = imread('Fig0206(a)(rose-original).tif');
% subplot(3,2,1),imshow(f),title('(a)原图像')
% % 垂直翻转图像
% fp = f(end:-1:1,:);subplot(3,2,2)
% imshow(fp),title('(b)垂直翻转图像')
% % 截取部分图像
% h_st = 257;h_ed = 768;
% w_st = 268;w_ed = 757;
% fc = f(h_st:h_ed,w_st:w_ed);subplot(3,2,3)
% imshow(fc),title('(c)截取部分图像')
% % 二次取样图像
% step = 20;fs = f(1:step:end,1:step:end);
% subplot(3,2,4),imshow(fs),title('(d)二次取样图像')
% % 通过图像中部的水平扫描线
% col = 512;subplot(3,2,[5 6])
% plot(f(size(f,1)/2,:)),title('(e)通过图像中部的水平扫描线')

[rt1,rt2, f1,f2,g,t1,t2,t3] = twodsin(1,1/(4*pi),1/(4*pi),512,512);
f1 = mat2gray(f1);subplot(1,3,1),imshow(f1)
title(['(a)未预分配数组:',num2str(t1),'s'])
f2 = mat2gray(f2);subplot(1,3,2),imshow(f2)
title(['(b)预分配数组:', num2str(t2),'s'])
g = mat2gray(g);subplot(1,3,3),imshow(g)
title(['(c)向量循环:', num2str(t3),'s'])
annotation('textbox', [0.45, 0.25, 0.1, 0.1], 'String', ['由(a)(c)得向量循环比没有预分配数组的 for 循环快了 ' num2str(rt1) ' 倍'], 'HorizontalAlignment', 'center', 'EdgeColor', 'none');
annotation('textbox', [0.45, 0.2, 0.1, 0.1], 'String', ['由(b)(c)得向量循环比有预分配数组的 for 循环快了 ' num2str(rt2) ' 倍'], 'HorizontalAlignment', 'center', 'EdgeColor', 'none');