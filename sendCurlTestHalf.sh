
#!/bin/bash

curl -H "Content-Type: application/json" -X POST -d '{"type":"combine","action":[{"type":"onOff","target":"Eclairage - Cave - Lambris (mur Sud)","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - Cave - hublot rond entrée et couloir","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - Cave - fluos cave à vin","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - Cave - fluos local aquarium","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - Cave - fluos évier aquarium","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - Cave - Projecteur Webcam","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - Cave - Eau Osmosée Cave","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - Cave - Groupe Clim Cave","action":"state", "delay":0},{"type":"onOff","target":"PilotagePrise - Cave - Vidange Eau de Mer","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - Cave - Remplissage Eau de Mer","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - Cave - Lled escalier extérieur Cave","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - Cave - Fluos Chaufferie","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - Cave - Contact Sec Chaudière","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - Cave - Contact Sec Eau Chaude","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - RDC - Spots Plafond Couloir Dégagement","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - RDC - Chemin balisage Couloir Dégagement","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - RDC - Luminaire salon","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - RDC - Salon Coin Nord-Ouest","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - RDC - Luminaire Salle à Manger","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - RDC - Barre Profilux Aquarium","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - RDC - Wavebox Aquarium","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - RDC - Eclairage Aquarium","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - RDC - Profilux Aquarium","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - RDC - Pompe Brassage Aquarium","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - RDC - Salle à Manger Coin Nord-Est","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - RDC - Cuisine Plafonnier","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - RDC - Cuisine Plan de Travail","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - RDC - Cuisine Meuble Intégré","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - RDC - Cuisine Plan Travail","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - RDC - PC Cuisine","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - RdC - SdB Spots Plafond","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - RDC - SdB Vasque","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - RDC - SdB Spot Douche","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - RDC - SdB Rampe Led","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - Jardin Avant - Façade avant Maison","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - Jardin Avant - Arbre","action":"state", "delay":0},{"type":"onOff","target":"Eclairage - Jardin Avant - Hotte Barbecue","action":"state", "delay":0},{"type":"onOff","target":"Eclairage Jardin Avant - Mur Sud","action":"state", "delay":0},{"type":"onOff","target":"Pilotage Prise - Jardin Avant - Gache Porte Entrée","action":"state", "delay":0}]}' http://localhost:3000