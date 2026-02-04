# On récupère le chemin du dossier courant où le script est exécuté
$cheminRacine = Get-Location

# Boucle pour créer les 15 semaines
ForEach ($i in 1..15) {

    # Convertit le numéro de la semaine en format à deux chiffres
    $numeroSemaine = $i.ToString("00")

    # Nom du dossier principal de la semaine
    $dossierSemaine = "Semaine$numeroSemaine"

    # Chemin complet du dossier de la semaine
    $cheminSemaine = Join-Path $cheminRacine $dossierSemaine

    # Message de suivi dans la console
    Write-Host "Création du dossier pour la semaine $numeroSemaine"

    # Création du dossier de la semaine
    New-Item -Path $cheminSemaine -ItemType Directory -Force | Out-Null

    # Création des sous-dossiers Note_de_cours et Travaux
    $cheminNotes = Join-Path $cheminSemaine "Note_de_cours"
    $cheminTravaux = Join-Path $cheminSemaine "Travaux"

    New-Item -Path $cheminNotes -ItemType Directory -Force | Out-Null
    New-Item -Path $cheminTravaux -ItemType Directory -Force | Out-Null

    Write-Host " Le dossier Note_de_cours a été créé"
    Write-Host " Le dossier Travaux a été créé"

    # Création du fichier note.md dans le dossier Note_de_cours
    $cheminFichierNote = Join-Path $cheminNotes "note.md"
    New-Item -Path $cheminFichierNote -ItemType File -Force | Out-Null

    Write-Host " Le fichier note.md a été créé dans Note_de_cours"
}

# Message final qui indique la fin du script
Write-Host "Création de la structure de session terminée avec succès."

