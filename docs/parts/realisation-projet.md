# La réalisation du projet

## La création des tables

**La table des newsletters**

```sql
CREATE TABLE IF NOT EXISTS newsletter
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    object VARCHAR(255),
    target VARCHAR(10) NOT NULL DEFAULT 'Général',
    content VARCHAR(255),
    is_send BOOLEAN NOT NULL DEFAULT 0,
    send_at DATE NOT NULL DEFAULT NOW(),
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (id),
    INDEX (object)
);
```

**La table des utilisateurs**

```sql
CREATE TABLE IF NOT EXISTS `user`
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    label VARCHAR(255),
    phone VARCHAR(20),
    picture BLOB,
    is_active BOOLEAN NOT NULL DEFAULT 0,
    is_member BOOLEAN NOT NULL DEFAULT 0,
    is_optin BOOLEAN NOT NULL DEFAULT 0,
    role VARCHAR(20) NOT NULL DEFAULT 'Exposant'
    CHECK (role in ('Exposant', 'Trésorier', 'Administrateur')),
    INDEX(first_name),
    INDEX(last_name),
    INDEX(label)
);
```

**La table pivot des newsletters et des utilisateurs**

```sql
CREATE TABLE IF NOT EXISTS newsletter_user
(
    newsletter_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (newsletter_id) REFERENCES newsletter (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE,
    PRIMARY KEY (newsletter_id, user_id)
);
```

**La table des événements**

```sql
CREATE TABLE IF NOT EXISTS `event`
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) UNIQUE NOT NULL,
    planned_at DATE NOT NULL,
    content TEXT NOT NULL,
    is_published BOOLEAN NOT NULL DEFAULT 0,
    picture BLOB,
    min_price DECIMAL(5,2) NOT NULL
    CHECK (min_price >= 0 AND min_price <= 999),
    num_available INTEGER(3) NOT NULL
    CHECK (min_price >= 0 AND min_price <= 999),
    INDEX(title)
);
```

**La table des réservations**

```sql
CREATE TABLE IF NOT EXISTS reservation
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status VARCHAR(20) NOT NULL DEFAULT 'A Payer'
    CHECK (status IN ('A Payer', 'Payé', 'Annulé')),
    paid_at DATE,
    comments TEXT,
    number INTEGER DEFAULT 1
    CHECK (number >= 1 AND number <= 12),
    total DECIMAL(6,2) DEFAULT 0
    CHECK (total >= 0 AND total <= 9999),
    mode_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (mode_id) REFERENCES mode (id),
    FOREIGN KEY (event_id) REFERENCES event (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
);
```

**La table des modes de paiement**

```sql
CREATE TABLE IF NOT EXISTS mode
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    label VARCHAR(50) UNIQUE NOT NULL,
    INDEX (label)
);
```

**La table des tables d'une réservation**

```sql
CREATE TABLE IF NOT EXISTS `table`
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    price DECIMAL(5,2) NOT NULL DEFAULT 0
    CHECK (price >= 0 AND price <= 999),
    pos_x INTEGER(3) NOT NULL DEFAULT 0,
    pos_y INTEGER(3) NOT NULL DEFAULT 0,
    comments TEXT,
    reservation_id INTEGER NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES reservation (id) ON DELETE CASCADE
);
```

## La gestion des utilisateurs

**Liste des utilisateurs (administration)**

```sql
SELECT u.id, u.first_name, u.last_name, u.label, u.email, u.phone, u.role, u.is_active, u.is_member, u.is_optin
FROM user u
```

**Inscription d'un utilisateur**

```sql
INSERT INTO user (first_name, last_name, label, email, password, phone, is_optin)
VALUES (:first_name, :last_name, :label, :email, :password, :phone, :is_optin)
```

**Edition manuelle d'un utilisateur (administration)**

```sql
UPDATE user (first_name, last_name, label, email, phone, role, is_active, is_member)
SET first_name = :first_name, 
    last_name = :last_name,
    label = :label,
    email = :email,
    phone = :phone,
    role = :role,
    is_active = :is_active,
    is_member = :is_member
WHERE id = :id
```

**Suppression d'un utilisateur**

```sql
DELETE FROM user
WHERE id = :id
```
