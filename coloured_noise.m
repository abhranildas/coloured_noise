function [coloured_noise_signal,white_noise_signal]=coloured_noise(sz,dim,exponent)
	% COLOURED_NOISE creates a power-law coloured noise hypercube, i.e.
    % array of equal side-length (must be even) in any number of dimensions.
	%
	% Abhranil Das <abhranil.das@utexas.edu>
	% Center for Perceptual Systems, University of Texas at Austin
	% If you use this code, please cite:
	% <a href="matlab:web('http://dx.doi.org/10.13140/RG.2.2.10585.80487')"
	% >Camouflage Detection & Signal Discrimination: Theory, Methods & Experiments</a>.
	%
	% Usage:
	% coloured_noise_signal=coloured_noise(sz,dim,exponent)
	% [coloured_noise_signal,white_noise_signal]=coloured_noise(sz,dim,exponent)
	%
	% Example:
	% pink_noise_signal=coloured_noise(100,1,-1)
	% [brown_noise_image,white_noise_image]=coloured_noise(256,2,-2)
	% blue_noise_cube=coloured_noise(256,3,1)
    % violet_noise_hypercube=coloured_noise(256,4,1)
	%
	% Inputs:
	% sz        length of each side of the signal array
	% dim       no. of dimensions of the array
	% exponent  exponent of the frequency-dependence of power density
	%
	% Outputs:
	% coloured_noise_signal     coloured noise signal array
	% white_noise_signal        white noise signal that was filtered to
    %                           make the coloured noise

    % white noise signal:
    white_noise_signal=squeeze(normrnd(0,1,[ones(1,dim)*sz 1]));

    % create Fourier filter
    % first create a line with squared distances from mid-point:
    dist=ones(sz,1);
    for i=1:sz
        dist(i)=norm(i-sz/2-1)^2;
    end

    % now add this along every dimension
    dist_tot=dist;
    for d=2:dim
        dist_add=reshape(dist,[ones(1,d-1) sz]);
        dist_tot=dist_tot+dist_add;
    end
    dist_tot=sqrt(dist_tot);

    filt=dist_tot.^(exponent*dim/2);
    filt(isinf(filt))=1; % leave DC unchanged

    % Fourier transform white noise, then fftshift to shift 0-frequency
    % to the center of the array, to align with filter whose
    % 0-frequency is also at the center. Otherwise multiplying
    % them together will not multiply corresponding elements.
    wnf = fftshift(fftn(white_noise_signal));

    % multiply with frequency filter
    wnf_filt = wnf.*filt;

    % ifftshift to first shift back the Fourier transform
    % to have 0-frequency at the start again. This lets
    % ifft2 do inverse Fourier transform correctly:
    coloured_noise_signal = ifftn(ifftshift(wnf_filt));