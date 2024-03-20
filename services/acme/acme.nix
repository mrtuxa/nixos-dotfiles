{config, ...}: {
  security.acme.defaults.email = config.sops.secrets."acme/email";
  security.acme.acceptTerms = true;
}