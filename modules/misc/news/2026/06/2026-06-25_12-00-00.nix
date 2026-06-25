{ config, ... }:
{
  time = "2026-06-25T12:00:00+00:00";
  condition = config.programs.nushell.enable && config.home.sessionVariables != { };
  message = ''
    {option}`home.sessionVariables` are now exported to nushell.

    Nushell is not POSIX-compatible and never sourced the generated
    `hm-session-vars.sh`, so session variables were previously missing from
    nushell sessions. They are now translated into `env.nu` as `$env.NAME`
    assignments, matching the existing behavior for bash, zsh, and fish.

    Caveats: `PATH` is skipped (it is a list in nushell — use
    {option}`home.sessionPath`); POSIX `$VAR` references inside values are
    emitted literally rather than expanded; and
    {option}`home.sessionVariablesExtra` is not translated. For computed or
    referencing values, use {option}`programs.nushell.environmentVariables`
    with `lib.hm.nushell.mkNushellInline`.
  '';
}
