function data_filtered = bilateral_local(data, window, sigmaR)
Nx = size(data,2);
data_filtered = zeros(Nx,1);
for i=1:Nx
    patch = reshape(data(:,i), window);
    
    [rows, cols] = find(patch == patch);
    rows = reshape(rows, window);
    cols = reshape(cols, window);
    Ncy = ceil(window(1)/2);
    Ncx = ceil(window(2)/2);
    dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
    diff = reshape(abs(data(:,i) - data(Ncy, i)), window);    
    g = exp(-((diff.^2)./(2*(sigmaR^2)))) .* dist; 
    
    data_filtered(i) = sum(sum(patch .* g))/sum(sum(g));
end
end