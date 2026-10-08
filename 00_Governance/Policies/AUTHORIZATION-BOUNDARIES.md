# Authorization Boundaries

Default state: READ-ONLY.

A runner may mutate only paths explicitly declared in its gate definition.
One authorized mutation boundary at a time.
No `git add .`.
No automatic standards-version promotion.
No automatic compliance promotion.
No production deployment from research runners.
No safety-function activation on physical equipment without a separate
authorized physical-safety boundary.
