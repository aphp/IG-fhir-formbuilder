Here, you'll learn how to create and save your first Questionnaire using AP-HP FormBuilder. 

Chromium-based browser are best supported. 

### FormBuilder connection

The first page when connecting to the formBuilder allow:
- the selection of an already existing Questionnaire
- the creation of a new Questionnaire, 

<div style="text-align:center">
    <a id="barre de menu">
        <img src="FB_landing_page.png" alt="FormBuilder connection page" width="75%" height="75%">
    </a>
</div>

### My first form

Click on the "+" button and provide a Title for your Questionnaire (an ID will be automatically created).

#### My first items

You arrive on the "Item" interface 

Each item defines a **question**, a **grouping element**, or a **label** to be displayed in the form.  

There is by default an "Item 0" in the Questions Tree (on the left). The only mandatory field to fill is the "Data type" field that permit the distinction between the 3 above-mentionned type of item, and, for the question type, the particular type of data to be captured. 

For this first item, we will modify: 
- Question text : Patient Id,
- "Source" - "Comment" : information is retrieved from a qualified Patient Identity Source,
- Data type : header (group/display),
- Allow repeating question : No,
- The other fields are left unchanged.

<div style="text-align:center">
    <a id="item creation">
        <img src="FB_item_creation_1.png" alt="Item interface of the FormBuilder" width="75%" height="75%">
    </a>
</div>

Clicking on the _Add new item_ button at the top/bottom of the page will create a new item after the active one. We will set it up as follow: 
- Question text : Last name,
- Data Type : string,
- Allow repeating question : No,
- Answer required : No,
- The other fields are left unchanged.

Drag the '"Last name'item and drop it on the "Patient Id" item in the question tree.

<div style="text-align:center">
    <a id="dragDrop">
        <img src="FB_drag_drop.gif" alt="Drag and drop in the question tree">
    </a>
</div>

By clicking on the button next to 'Last name' in the tree :

<div style="text-align:center">
    <a id="FB_bouton_item">
        <img src="FB_bouton_item.png" alt="Item button in the question tree">
    </a>
</div>

We can create the next item directly at the right place in the tree (**after**)
- Question text : Given name,
- Data Type : string,
- Allow repeating question : Yes,
- Answer required : No,
- The other fields are left unchanged.

#### Form level attributes

Clicking on the "Edit form attributes" button at the top of the screen will display some Questionnaire level information. The title is already filled and you may enrich: 
- the status is mandatory, and by default set on 'draft'
- a description : "This form demonstrates AP-HP FormBuilder for new users",
- a version : "0.0.1",
- a publisher : "AP-HP".

<div style="text-align:center">
    <a id="formLevelAttributes">
        <img src="FB_form_attributes.png" alt="Form level attributes" width="75%" height="75%">
    </a>
</div>

### Save my form

<span>You can save your form on the FHIR server, via this button:<img src="save.png" alt="save" width="50%" height="50%"> (on the top left of the screen).</span>

### Preview form

<span>You may preview your form using this button:<img src="preview.png" alt="preview" width="4%" height="4%">(on the top left of the screen).</span>

<div style="text-align:center">
    <a id="FB_preview_rendered">
        <img src="FB_preview_rendered.png" alt="Preview" width="50%" height="50%">
    </a>
</div>

### Find my form
You can find your form using the search engine, e.g. by its title:

<div style="text-align:center">
    <a id="FB_loading">
        <img src="FB_import_from_server.gif" alt="Loading from fhir server" width="67%" height="67%">
    </a>
</div>

### IG integration of my form
The created FHIR Questionnaire can be published in a FHIR Implementation Guide for diffusion:

[My first form](Questionnaire-Myfirstform.html)



{% include markdown-link-references.md %}