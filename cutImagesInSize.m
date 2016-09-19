%% Usage : cutImagesInSize(srcDir, outputDir, numPatchesInImage, patchWid, patchHei) %%
%% Saumya Rawat Assign3 201401110 %%
%% Code obtained from http://www.geocities.ws/talh_davidc/ %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function cutImagesInSize(srcDir, outputDir, numPatchesInImage, patchWid, patchHei)
	files = getAllFiles(srcDir);
	[num_files, dim] = size(files);

	for i = 1 : num_files
		im = imread(files{i});
		[hei, wid, dim] = size(im);
		maxWid = wid - patchWid;
		maxHei = hei - patchHei;
		for j = 1 : numPatchesInImage
			output_filename = [outputDir '/' num2str(i) '_' num2str(j) '.jpg'];
			xPnt = randi([1 maxWid]);
			yPnt = randi([1 maxHei]);
			patch = im(yPnt:yPnt + patchHei - 1, xPnt:xPnt + patchWid - 1, :);
			imwrite(patch, output_filename);
		end
	end
end
