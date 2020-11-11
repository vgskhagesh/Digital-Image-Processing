clear;

%% Load Input Image and Target Image
image = imread('givenhist.jpg');        %input image
[p,cdf,quantized] = func(image);
image_target = imread('sphist.jpg');    %target image
[p_target,cdf_target,quantized_target] = func(image_target);

pixels = length(cdf);
tranformation = zeros(pixels,1);
for i=1:pixels
    index = find(cdf_target>=cdf(i));
    tranformation(i) = index(1)-1;
end

p_derived = zeros(256,1);
for i=1:256
    p_derived(i) = sum(p(tranformation==i-1));
end

fig = plot(p,'color','r');              %Originaal image histogram
hold on
plot(p_target,'color','b');             %Target Image histogram
hold on
plot(p_derived,'color','g');            %Transformed Image Histogram
legend('Origianl Histogram', 'Target Histogram', 'Derived Histogram');
title('Histogram for original, target and transformed images with specified colours.');

saveas(fig,'histogram_output.jpg')

%% Function
function [p,cdf,quantized] = func(image)
    %Inputs :
    %   image - image
    %Outputs :
    %   p         - probabilty of each pixel (0,255)
    %   cdf       - cumulative distribution function of each pixel
    %   quantized - quantize cdf multiplied with 255 to the nearest  integer
    
    [m,n] = size(image);
    N = m*n;
    p = zeros(256,1);
    for i=0:255
        p(i+1) = length(image(image==i))/N;
    end
    cdf = p;
    for i=2:256
        cdf(i) = cdf(i)+cdf(i-1);
    end
    quantized = round(255*cdf);
end