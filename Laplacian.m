classdef Laplacian
        
    properties
        image
    end
    
    methods
        function obj = Laplacian(image)
            obj.image = image;
        end
        
        function filteredImage = filter(obj)
            filter = [
                0 -1 0
                -1 5 -1
                0 -1 0
                ];
            filteredImage = imfilter(obj.image, filter);
        end
        
        function umImage = unsharpMasking(obj, mean)
            blurredImage = imgaussfilt(obj.image, mean);
            umImage = imsubtract(obj.image, blurredImage);
        end
        
        function highBoostedImage = highBoost(obj)
            A = 1;
            multipliedImage = A.*obj.image;
            highBoostedImage = imsubtract(multipliedImage, unsharpMasking(obj));
        end
    end
    
end

