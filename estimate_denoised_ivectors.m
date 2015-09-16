function denoised_test_ivec = estimate_denoised_ivectors(noisy_train_ivec,clean_train_ivec,noisy_test_ivec)
% ivector denoising method based on ICASSP'15 paper: ADDITIVE NOISE COMPENSATION IN THE I-VECTOR SPACE FOR SPEAKER RECOGNITION
% noisy_train_ivec: ivectors trained on noisy data
% clean_train_ivec: ivectors trained on clean data
% noisy_test_ivec: test noisy ivectors to be denoised
% denoised_test_ivec: denoised test ivectors

estimated_noise_train_ivec=noisy_train_ivec-clean_train_ivec;
sigma_noise=cov(estimated_noise_train_ivec)^-1;
sigma_clean=cov(clean_train_ivec)^-1;


mu_noise=mean(estimated_noise_train_ivec)';
mu_clean=mean(clean_train_ivec)';

denoised_test_ivec=[];
for i = 1:length(denoised_test_ivec)
	denoised_test_ivec(i,:)=((sigma_noise+sigma_clean)^-1)*((sigma_noise*(noisy_test_ivec(i,:)'-mu_noise))+(sigma_clean*mu_clean));
end
denoised_test_ivec=length_norm(denoised_test_ivec')';
