/* ============================================================
   COMMIT LOG:
   [INIT]     Базовая таблица заказов
   [PAYMENT]  Подготовка к интеграции платежей
   [STATUS]   Жизненный цикл заказа
============================================================ */

CREATE TABLE orders (

  /* [INIT] Идентификация заказа */
  id SERIAL PRIMARY KEY,

  /* [RELATION] Связь с пользователем */
  user_id INTEGER NOT NULL,

  /* [STATUS] Состояние заказа */
  -- pending | paid | cancelled | refunded
  status VARCHAR(30) NOT NULL DEFAULT 'pending',

  /* [PAYMENT] Финансовые данные */
  total NUMERIC(12,2) NOT NULL CHECK (total >= 0),
  currency VARCHAR(10) NOT NULL DEFAULT 'USD',

  /* [INFO] Комментарий менеджера */
  comment TEXT,

  /* [AUDIT] */
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT fk_orders_user
    FOREIGN KEY (user_id) REFERENCES users(id)
);
