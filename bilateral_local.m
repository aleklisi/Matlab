function data_filtered = bilateral_local(data, local_window, sigmam)
h = fspecial('gaussian',local_window,25);
Nx = size(data,2);
data_filtered = zeros(Nx,1);
for i = 1:Nx
    [rows,cols] = find(patch == patch);
    rows = reshape(rows,local_window);
    cols = reshape(cols,local_window);
    Ncy = ceil(local_window(1)/2);
    Ncx = ceil(local_window(2)/2);
    dist = sqrt((Ncy -rows).^2 + (Ncx - cols).^2);
end

