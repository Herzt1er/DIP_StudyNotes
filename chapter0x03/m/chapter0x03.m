% % ���� imadjust
% f = imread('Fig0303(a)(breast).tif');
% subplot(2,2,1),imshow(f)
% title('(a) ԭʼ�����鷿ͼ��')
% % ������תͼ�񣨸�Ƭͼ��
% % ��ǿǶ���ڴ�Ƭ��ɫ�����еİ�ɫ/��ɫϸ��
% % g = imcomplement(f); ͬ��Ч��
% g1 = imadjust(f,[0 1],[1 0]);
% subplot(2,2,2),imshow(g1),title('(b) ��Ƭͼ��')
% % ͻ������Ȥ�����ȴ� [0.5 0.75]
% g2 = imadjust(f,[0.5 0.75],[0 1]);
% subplot(2,2,3),imshow(g2),title('(c) ���ȷ�Χ��չΪ [ 0.5 , 0.75 ]')
% % ѹ���Ҷȼ��ĵͶ˲���չ�Ҷȼ��ĸ߶�
% g3 = imadjust(f,[ ],[ ],2);
% subplot(2,2,4),imshow(g3),title('(d) gamma = 2 ��ǿͼ��')

% f = imread('Fig0305(a)(spectrum).tif');
% subplot(1,2,1),imshow(f)
% title('(a)�����Ա����ߵ�8����ϵͳ�ϵĸ���ҶƵ��')
% % ȷ�������任���ͼ������ֵ��Χ�� [0,1] ��
% % ����Χ�� [0,1] ��ͼ��ת��Ϊ 8 λ�޷���������ʾ
% g = im2uint8(mat2gray(log(1+double(f))));
% subplot(1,2,2),imshow(g),title('(b) ִ�ж����任��')

f = imread('Fig0306(a)(bone-scan-GE).tif');
subplot(1,2,1),imshow(f),title('(a) ����ɨ��ͼ��')
g = intrans(f, 'stretch', mean2(im2double(f)), 0.9);
subplot(1,2,2),imshow(g),title('(b) �Աȶ�����任��ǿ')