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