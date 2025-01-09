Cette page décrit comment créer et sauvegarder son premier questionnaire à l'aide du FormBuilder

Il est préférable d'utiliser un navigateur reposant sur chromium (Edge par exemple). 

### Connection au FormBuilder

Aller sur [Form Builder (sandbox)]

Depuis l'extérieur, il faudra soit un VPN (Citrix Secure access par exemple), soit se connecter sur le portail captif.

Vous arrivez ici :

<div style="text-align:center">
    <a id="barre de menu">
        <img src="FB_form_creation.png" alt="écran de mode de création de formulaire" width="75%" height="75%">
    </a>
</div>

### Mon premier formulaire

Sélectionnez "Start from Scratch" et continuez.

Vous arrivez sur la page **Form level attributes** sur laquelle vous pouvez renseigner des informations de niveau questionnaire - nativement, seul le statut est obligatoire :
- un titre : "Exemple Quick Start". Cet élément permettra plus tard de retrouver son formulaire,
- le name est déduit automatiquement du titre, 
- un statut, par défaut à "draft",
- une description : "Ce formulaire permet de démontrer le fonctionnement du Form Builder pour les nouveaux utilisateurs",
- une version : "0.0.1",
- un publisher : "AP-HP".

<div style="text-align:center">
    <a id="form level attributes">
        <img src="FB_form_attributes.png" alt="écran Form level attributes du FormBuilder" width="75%" height="75%">
    </a>
</div>

### Mes premiers items

Cliquez ensuite sur un des boutons _Edit questions_ (en haut ou en bas de l'écran)

Vous arrivez sur l'interface de création d'item.
Chaque item correspond à une **question**, à un élément de **regroupement de question** ou a un **affichage** dans le formulaire.

Un premier item existe par défaut. Les champs obligatoires sont :
- link id : il s'agit d'un identifiant unique d'item à l'intérieur d'un questionnaire. Il est généré automatiquement par le FormBuilder, vous n'avez pas à vous en occuper.
- un Data type : qui précise le type de l'item : **question**, **groupe** ou **affichage**.

Pour ce premier item on va éditer : 
- Question text : Identité patient,
- Data type : header (group/display),
- Allow repeating question : No,
- Les autres champs restent inchangés.

<div style="text-align:center">
    <a id="item creation">
        <img src="FB_item_creation_1.png" alt="écran de création d'item du FormBuilder" width="75%" height="75%">
    </a>
</div>

À l'aide du bouton _Add new item_ en bas de page, on va créer un nouvel item :
- Question text : Nom patronymique,
- Data Type : string,
- Allow repeating question : No,
- Answer required : No,
- Les autres champs restent inchangés.

Dans l'arborescence à gauche, on glissera/déposera l'item nouvellement créé sur l'item 'Identité patient'.

<div style="text-align:center">
    <a id="glisser déposer">
        <img src="FB_glisser_deposer.gif" alt="illustration du glisser déposer dans l'arborescence des items du FormBuilder">
    </a>
</div>

En cliquant sur le bouton à côté de l'item 'Nom patronymique' dans l'arborescence :

<div style="text-align:center">
    <a id="FB_bouton_item">
        <img src="FB_bouton_item.png" alt="bouton de manipulation des items dans l'arborescence">
    </a>
</div>

On créera directement le prochain item au bon endroit de l'arborescence des items (**after**) :
- Question text : Prénom,
- Data Type : string,
- Allow repeating question : Yes,
- Answer required : No,
- Les autres champs restent inchangés.

### Visualiser mon formulaire

En haut à droite de l'interface, un bouton preview vous permet d'avoir un aperçu de votre questionnaire :

<div style="text-align:center">
    <a id="FB_apercu_rendered">
        <img src="FB_apercu_rendered.png" alt="aperçu avec rendu" width="50%" height="50%">
    </a>
</div>

### Sauvegarder mon formulaire

En haut à gauche de l'interface, vous pouvez exporter votre formulaire :
- soit dans un fichier JSON local, via le bouton : ![disquette](disk.png), 
- soit sur le serveur, via le bouton : <img src="fork.png" alt="fourchette">.

### Retrouver mon formulaire
En vous reconnectant ultérieurement sur [Form Builder (sandbox)], vous pourrez :
 - 'Import from local file' et charger le fichier JSON que vous aurez préalablement enregistré sur votre ordinateur
 - 'Import from FHIR server'

Dans ce dernier cas, plusieurs modalités de recherches dans le serveur sont proposées, par exemple par le 'Title' renseigné dans la page **Form level attributes** : 

<div style="text-align:center">
    <a id="FB_apercu_rendered">
        <img src="FB_import_from_server.png" alt="aperçu avec rendu" width="67%" height="67%">
    </a>
</div>

### Intégration de mon formulaire dans le présent guide d'implémentation
Le résultat de ce travail est dès lors publiable dans un guide d'implémentation qui permet de partager largement les ressources produites :

[exemple-quick-start]



{% include markdown-link-references.md %}