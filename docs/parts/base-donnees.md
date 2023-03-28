# La base de données

## Les schémas

### MCD -  Modèle Conceptuel de Données

!"./schemas/entities/MCD.png"

### MLD -  Modèle Logique de Données

!"./schemas/entities/MLD.png"

### MPD -  Modèle Physique de Données

- newsletter (**id**, object, target, content, is_send, send_at)
- newsletter_user (**#newsletter_id, #user_id**)
- user (**id**, email, password, first_name, last_name, label, picture, phone, is_active, is_member, is_optin, role)
- event (**id**, title, planned_at, picture, content, is_published, min_price, num_available)
- reservation (**id**, status, paid_at, comments, number, total, **#event_id**, **#user_id**, **#mode_id**)
- mode (**id**, label)
- table (**id**, price, pos_x, pos_y, comments, **#reservation_id**)

### Modèle relationnel (PHPMyAdmin)

![relations](./schemas/entities/relations.png)

## Les entités

### Newsletter - Les newsletters

%db-newsletter.csv;4

### User - Les utilisateurs

%db-user.csv;4

### Event - Les événements

%db-event.csv;4

### Reservation - Les réservations

%db-reservation.csv;4

### Mode - Les modes de paiement

%db-mode.csv;4

### Table - Les tables

%db-table.csv;4

## Les cardinalités

### User (0,n) - Newsletter (1,n)

Un utilisateur peut envoyer plusieurs newsletters. (**0,n**)

Une newsletter est envoyée à au moins un utilisateur. (**1,n**)

### User (0,n) - Reservation (1,1)

Un utilisateur peut faire plusieurs réservations. (**0,n**)

Une réservation concerne un seul utilisateur. (**1,1**)

### Mode (0,n) - (1,1) Reservation

Un mode de paiement peut concerner plusieurs réservations. (**0,n**)

Une réservation est réglée avec un seul mode de paiement. (**1,1**)

### Event (0,n) - (1,1) Reservation

Un événement peut regrouper plusieurs réservations. (**0,n**)

Une réservation concerne un seul événement. (**1,1**)

### Table (1,1) - (1,n) Reservation

Une table est liée à une seule réservation. (**1,1**)

Une réservation regroupe au moins une table. (**1,n**)
