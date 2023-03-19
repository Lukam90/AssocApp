-- Liste des utilisateurs

SELECT u.id, u.first_name, u.last_name, u.label, u.email, u.phone, u.role, u.is_active, u.is_member, u.is_optin
FROM user u

-- Recherche d'un utilisateur

SELECT u.id, u.first_name, u.last_name, u.label, u.email, u.phone, u.role, u.is_active, u.is_member, u.is_optin
FROM user u
WHERE u.first_name LIKE '%' . :first_name . '%'
OR    u.last_name LIKE '%' . :last_name . '%'
OR    u.label LIKE '%' . :label . '%'

-- Ajout d'un utilisateur

INSERT INTO user (first_name, last_name, label, email, phone, role, is_active, is_member)
VALUES (:first_name, :last_name, :label, :email, :phone, :role, :is_active, :is_member)

-- Edition d'un utilisateur

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

-- Suppression d'un utilisateur

DELETE FROM user
WHERE id = :id