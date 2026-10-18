-- Add method column to vrf_audit_log to record which randomness scheme
-- (VRF or PRNG) secured each draw.

ALTER TABLE vrf_audit_log ADD COLUMN IF NOT EXISTS method TEXT NOT NULL DEFAULT 'VRF';

COMMENT ON COLUMN vrf_audit_log.method IS
  'Randomness scheme used for this draw: VRF (Ed25519 verifiable) or PRNG (deterministic hash).';

CREATE INDEX IF NOT EXISTS idx_vrf_audit_log_method ON vrf_audit_log (method);