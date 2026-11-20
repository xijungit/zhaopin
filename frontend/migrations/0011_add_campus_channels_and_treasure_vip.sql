-- 0011_add_campus_channels_and_treasure_vip.sql
-- 支持新增版块：企业校招 (enterprise)、央国企校招 (soe)、官方内推 (referral)
-- 支持藏宝阁 9.9 元会员解锁与免积分权益

ALTER TABLE job_referrals ADD COLUMN channel_type TEXT NOT NULL DEFAULT 'referral';
ALTER TABLE job_referrals ADD COLUMN soe_type TEXT;

CREATE INDEX IF NOT EXISTS idx_jobs_channel_type ON job_referrals(channel_type);
CREATE INDEX IF NOT EXISTS idx_jobs_channel_publish ON job_referrals(channel_type, publish_time DESC);

ALTER TABLE users ADD COLUMN is_treasure_vip INTEGER NOT NULL DEFAULT 0;
ALTER TABLE users ADD COLUMN treasure_vip_activated_at TEXT;

ALTER TABLE payment_orders ADD COLUMN order_type TEXT NOT NULL DEFAULT 'points';
