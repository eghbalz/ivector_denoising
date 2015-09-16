function denoised_test_ivec = estimate_denoised_ivectors(noisy_train_ivec,clean_train_ivec,noisy_test_ivec)
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
