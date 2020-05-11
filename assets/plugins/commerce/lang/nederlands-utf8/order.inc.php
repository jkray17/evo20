<?php

setlocale(LC_ALL, 'nl_NL.UTF-8');

return [
    'order.name_field' => 'Voornaam',
    'order.email_field' => 'E-mail',
    'order.phone_field' => 'Тelefoon',
    'order.submit_btn' => 'Verzend bestelling',
    'order.error.name_required' => 'Voer je naam in',
    'order.error.email_required' => 'Voer e-mail in',
    'order.error.email_incorrect' => 'Voer uw e-mailadres correct in',
    'order.error.phone_required' => 'Voer telefoon in',
    'order.success' => '@CODE:<div>Bedankt voor je bestelling.</div>',
    'order.subject' => '@CODE:Nieuwe online bestelling via [(site_name)]',
    'order.subject_status_changed' => '@CODE:Bestellingsstatus #[+order.id+] is aangepast',
    'order.order_paid' => '@CODE:Ontvangen betaling ter hoogte van [+amount+]',
    'order.order_full_paid' => '@CODE:Ontvangen betaling ter hoogte van [+amount+], bestelnummer #[+order.id+] volledig betaald!',
    'order.subject_order_paid' => '@CODE:Bestelnummer #[+order.id+] betaald!',
    'order.status.new' => 'Nieuw',
    'order.status.processing' => 'In verwerking',
    'order.status.paid' => 'Betaald',
    'order.status.shipped' => 'Afgeleverd',
    'order.status.canceled' => 'Geannuleerd',
    'order.status.complete' => 'Voltooid',
    'order.status.pending' => 'Verwacht',
    'order.status_title' => 'Status',
    'order.amount_title' => 'Aantal',
    'order.delivery_title' => 'Bezorgmethode',
    'order.payment_title' => 'Betaalmethode',
    'order.contact_group_title' => 'Gegevens van de klant',
    'order.payment_delivery_group_title' => 'Betaal- en bezorgmethode',
    'order.to_pay_title' => 'Voor betaling',
    'order.order_info' => 'Bestelgegevens',
    'order.order_id' => 'Bestelnummer',
    'order.created_at' => 'Aanmaakdatum',
    'order.redirecting_to_payment' => 'Doorsturen betaling...',
    'order.order_payment_link' => '@CODE:<p>Om te betalen voor de bestelling, klikt u op de link <a href="[+link+]">[+link+]</a></p>',
    'order.order_data_changed' => '@CODE:Volgorde #[+order.id+] is gewijzigd!',
    'order.' => '',
];
