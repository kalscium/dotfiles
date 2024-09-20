{
  services.kanata = {
    enable = true;
    keyboards.main.config = ''
      (defsrc
        caps
      )

      (deflayer base
        esc
      )
    '';
  };
}
