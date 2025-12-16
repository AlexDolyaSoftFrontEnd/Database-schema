/* ============================================================
   COMMIT LOG:
   [INIT]      Таблица платежей
   [PROVIDER]  Поддержка разных платёжных систем
   [SECURITY]  Без хранения чувствительных данных
============================================================ */

CREATE TABLE payments (

  /* [INIT] */
  id SERIAL PRIMARY KEY,

  /* [RELATION] */
  order_id INTEGER NOT NULL,

  /* [PROVIDER] */
  -- stripe | paypal | fondy | wayforpay
  provider VARCHAR(50) NOT NULL,

  /* [AMOUNT] */
  amount NUMERIC(12,2) NOT NULL CHECK (amount >= 0),
  currency VARCHAR(10) NOT NULL DEFAULT 'USD',

  /* [STATUS] */
  -- pending | success | failed
  status VARCHAR(30) NOT NULL,

  /* [EXTERNAL] */
  transaction_id VARCHAR(120),

  /* [AUDIT] */
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
