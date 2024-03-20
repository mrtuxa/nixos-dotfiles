{config, inputs, ...}: {
  security.acme.defaults.email = sops.secrets."acme/email";
  security.acme.acceptTerms = true;
}