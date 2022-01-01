folder  = 'P:\Assignments_Lab_Reports_LaTeX\Signal analysis\Lab_March_1_2021\Codes';
list    = dir(fullfile(folder, '*.m'));
nFile   = length(list);
success = false(1, nFile);
for k = 1:nFile
  file = list(k).name;
  try
    figure();
    fprintf('Running file: %s\n', file);
    run(fullfile(folder, file));
    [pathstr, name, ext] = fileparts(file);
    print('-depsc', sprintf('%s.eps',name));
    success(k) = true;
  catch
    fprintf('failed: %s\n', file);
  end
end



