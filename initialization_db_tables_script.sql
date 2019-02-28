-- CUSTOCONFIG_T 
-- TEST_URL
INSERT INTO "CONTRACT_MANAGEMENT"."CUSTCONFIG_T" VALUES(
	'DEFAULT','SUBAPP_PORTAL_ENEL_LOG','https://flpnwc-a98be70d8.dispatcher.hana.ondemand.com/sites/eneltgxsubapp','','I','EQ','1');
INSERT INTO "CONTRACT_MANAGEMENT"."CUSTCONFIG_T" VALUES(
	'DEFAULT','SUBAPP_PORTAL_ENEL_SUP','https://flpnwc-a98be70d8.dispatcher.hana.ondemand.com/sites/eneltgxsubapp?saml2idp=https://afqxozn24.accounts.ondemand.com','','I','EQ','1');

-- ATTACHMENT_STATUS
INSERT INTO "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" VALUES(1,1);
INSERT INTO "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" VALUES(2,2);
INSERT INTO "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" VALUES(3,3);
INSERT INTO "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" VALUES(4,4);

-- ATTACHMENT_STATUS_T
INSERT INTO "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" VALUES(1,'IT', 'Da Convalidare');
INSERT INTO "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" VALUES(2,'IT', 'Convalidato');
INSERT INTO "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" VALUES(3,'IT', 'Rifiutato');
INSERT INTO "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" VALUES(4,'IT', 'Convalidato (Forzato)');

-- CONTRACT_ASS_STATUS
INSERT INTO "CONTRACT_MANAGEMENT"."CONTRACT_ASS_STATUS" VALUES(1,1);
INSERT INTO "CONTRACT_MANAGEMENT"."CONTRACT_ASS_STATUS" VALUES(2,2);

-- CONTRACT_ASS_STATUS_T
INSERT INTO "CONTRACT_MANAGEMENT"."CONTRACT_ASS_STATUS_T" VALUES(1,'EN', 'Draft');
INSERT INTO "CONTRACT_MANAGEMENT"."CONTRACT_ASS_STATUS_T" VALUES(2,'EN', 'Confirmed');

-- CS_ROLES
INSERT INTO "CONTRACT_MANAGEMENT"."CS_ROLES" VALUES(1,1);
INSERT INTO "CONTRACT_MANAGEMENT"."CS_ROLES" VALUES(2,2);
INSERT INTO "CONTRACT_MANAGEMENT"."CS_ROLES" VALUES(3,3);

-- CS_ROLES_T
INSERT INTO "CONTRACT_MANAGEMENT"."CS_ROLES_T" VALUES(1,'EN', 'Contract Supervisor');
INSERT INTO "CONTRACT_MANAGEMENT"."CS_ROLES_T" VALUES(2,'EN', 'ACS SIC');
INSERT INTO "CONTRACT_MANAGEMENT"."CS_ROLES_T" VALUES(3,'EN', 'ACS AMM');

-- DOC_TYPES
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES" VALUES(1,1, 'SUPPLIER');
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES" VALUES(2,2, 'SUPPLIER');
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES" VALUES(3,3, 'SUPPLIER');
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES" VALUES(4,4, 'WORKER');
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES" VALUES(5,1, 'CONTRACT');
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES" VALUES(6,2, 'CONTRACT');
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES" VALUES(7,5, 'VEHICLE');
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES" VALUES(8,6, 'EQUIPMENT');

-- DOC_TYPES_T
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES_T" VALUES(1,'IT', 'DOC. AMMINISTRATIVA');
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES_T" VALUES(2,'IT', 'DOC. SALUTE&SICUREZZA');
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES_T" VALUES(3,'IT', 'DOC. SPECIALISTICA');
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES_T" VALUES(4,'IT', 'DOC. PERSONALE ESTERNO');
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES_T" VALUES(5,'IT', 'DOC. MEZZI');
INSERT INTO "CONTRACT_MANAGEMENT"."DOC_TYPES_T" VALUES(6,'IT', 'DOC. ATTREZZATURE');

-- QUALIFICATIONS
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(1,1);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(2,2);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(3,3);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(4,4);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(5,5);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(6,6);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(7,7);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(8,8);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(9,9);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(10,10);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(11,11);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(12,12);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(13,13);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(14,14);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(15,15);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(16,16);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(17,17);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(18,18);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(19,19);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(20,20);
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS" VALUES(21,21);

-- QUALIFICATIONS_T
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(1,'IT', 'Operaio');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(2,'IT', 'Saldatore');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(3,'IT', 'Addetto al montaggio/smontaggio/trasformazione dei ponteggi');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(4,'IT', 'Scoibentatore');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(5,'IT', 'Refrattarista');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(6,'IT', 'Carpentiere');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(7,'IT', 'Resinatore');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(8,'IT', 'Operatore subacqueo');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(9,'IT', 'Rocciatore');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(10,'IT', 'Muratore');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(11,'IT', 'Verniciatore');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(12,'IT', 'Meccanico');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(13,'IT', 'Consulente');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(14,'IT', 'Addetto alla conduzione di mezzi trasporto, movimentazione materiali, sollevamento, piattaforme di lavoro mobili elevabili, gru a torre, gru mobile, gru per autocarro, carrelli elevatori semoventi con conducente a bordo, macchine movimento terra – escavatori idraulici, a fune, pale caricatrici frontali, terne, autoribaltabili a cingoli, ecc), macchine operatrici, attrezzature in genere e opere provvisionali');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(15,'IT', 'Camionista');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(16,'IT', 'Supervisore');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(17,'IT', 'PES, PAV, PEI per attività con rischi di natura elettrica');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(18,'IT', 'Lavoratore per attività in Luoghi Confinati');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(19,'IT', 'Addetto all’utilizzo di DPI 3° Categoria');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(20,'IT', 'Addetto rimozione bonifica e smaltimento materiali contenenti amianto');
INSERT INTO "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" VALUES(21,'IT', 'Lavori su fune');

-- VEHICLES_TYPES
INSERT INTO "CONTRACT_MANAGEMENT"."VEHICLES_TYPES" VALUES(1, 1);
INSERT INTO "CONTRACT_MANAGEMENT"."VEHICLES_TYPES" VALUES(2, 2);
INSERT INTO "CONTRACT_MANAGEMENT"."VEHICLES_TYPES" VALUES(3, 3);
INSERT INTO "CONTRACT_MANAGEMENT"."VEHICLES_TYPES" VALUES(4, 4);
INSERT INTO "CONTRACT_MANAGEMENT"."VEHICLES_TYPES" VALUES(5, 5);

-- VEHICLES_TYPES_T
INSERT INTO "CONTRACT_MANAGEMENT"."VEHICLES_TYPES_T" VALUES(0,'IT', '');
INSERT INTO "CONTRACT_MANAGEMENT"."VEHICLES_TYPES_T" VALUES(1,'IT', 'Mezzi trasporto persone e movimentazione materiali (autocarro)');
INSERT INTO "CONTRACT_MANAGEMENT"."VEHICLES_TYPES_T" VALUES(2,'IT', 'Autocarro con gru'); 
INSERT INTO "CONTRACT_MANAGEMENT"."VEHICLES_TYPES_T" VALUES(3,'IT', 'Piattaforme aeree');
INSERT INTO "CONTRACT_MANAGEMENT"."VEHICLES_TYPES_T" VALUES(4,'IT', 'Ponti mobili sviluppabili');
INSERT INTO "CONTRACT_MANAGEMENT"."VEHICLES_TYPES_T" VALUES(5,'IT', 'Macchine operatrici');

-- WORKER_CONTRACT_TYPES
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES" VALUES(1, 1);
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES" VALUES(2, 2);
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES" VALUES(3, 3);

-- WORKER_CONTRACT_TYPES_T
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES_T" VALUES(1,'IT', 'INDETERMINATO');
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES_T" VALUES(2,'IT', 'DETERMINATO');
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES_T" VALUES(3,'IT', 'DISTACCO');

-- WORKER_ROLES
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(1, 1);
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(2, 2);
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(3,3);
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(4,4);
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(5,5);
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(6,6);
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(7,7);
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(8,8);
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(9,9);
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(10,10);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(10,10);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(11,11);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(12,12);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(13,13);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(14,14);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(15,15);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(16,16);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(17,17);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(18,18);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(19,19);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(20,20);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(21,21);
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES" VALUES(22,22);

-- WORKER_ROLES_T
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(1,'IT', 'RSPP');
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(2,'IT', 'ASPP');
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(3,'IT', 'RLS');
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(4,'IT', 'Preposto');
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(5,'IT', 'Capo Cantiere / Rappresentante dell’impresa');
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(6,'IT', 'Capo Squadra');
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(7,'IT', 'Incaricato dell’attuazione delle misure di prevenzione incendi e lotta antincendio');
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(8,'IT', 'Incaricato delle misure di evacuazione, incaricati del primo soccorso e gestione dell’emergenza');
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(9,'IT', 'Medico Competente');
INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(10,'IT', 'Altro');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(10,'IT', 'RESINATORE');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(11,'IT', 'SOMMOZZATORE');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(12,'IT', 'ROCCIATORE');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(13,'IT', 'MURATORE');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(14,'IT', 'VERNICIATORE');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(15,'IT', 'MECCANICO');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(16,'IT', 'CONSULENTE');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(17,'IT', 'ESCAVATORISTA');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(18,'IT', 'GRUISTA');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(19,'IT', 'MULETTISTA');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(20,'IT', 'CAMIONISTA');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(21,'IT', 'SUPERVISORE');
-- INSERT INTO "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" VALUES(22,'IT', 'ELETTRICISTA');

-- inserimento documenti comuni anagraf. forn/contr doc amministrativi
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 1, 1,'Iscrizione alla camera di commercio, industria ed artigianato ', 'Iscrizione alla camera di commercio, industria ed artigianato con oggetto sociale inerente alla tipologia dell’appalto.', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 2, 1,'Documento di regolarità contributiva (DURC)', 'Documento di regolarità contributiva (DURC in originale) in corso di validità (documento del tipo previsto per appalti di lavori pubblici; il documento deve essere rinnovato e riconsegnato ad ogni scadenza, 3 mesi, per tutto il periodo di gestione del contratto); In caso di presenza di lavoratori in somministrazione/distacco l’appaltatore/subappaltatore dovrà fornire il DURC anche per questi lavoratori, facendo da tramite con i relativi datori di lavoro', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 3, 1,'Polizza assicurativa', 'Polizza assicurativa, con relativa quietanza di pagamento premio, contro danni a persone e cose di Enel/impresa/terzi, con rinuncia da parte della società assicuratrice al diritto di rivalsa nei confronti di Enel; la polizza dovrà riportare la seguente dichiarazione: “Questa compagnia di Assicurazione fa espressa rinuncia al diritto di rivalsa nei confronti dell’Enel. La presente polizza copre l’assicurato contro tutti i danni alle persone ed alle cose anche di sua proprietà”', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 4, 5,'Richiesta di ingresso in centrale per dipendenti', 'Richiesta di ingresso in centrale per dipendenti e mezzi corredato con le informazioni relative a: nome e cognome; residenza; qualifica; tipologia di contratto; se il lavoratore è a tempo determinato precisare data scadenza contratto; aggiungere, inoltre, i seguenti dati relativi all’impresa: numero di posizione assicurativa INPS; numero di posizione assicurativa INAIL; estremi posizione assicurativa territoriale INAIL; eventuale Cassa Edile;', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 5, 5,'Richiesta di ingresso in centrale per mezzi', 'Richiesta di ingresso in centrale per dipendenti, mezzi e attrezzature ', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 6, 5,'Richiesta di ingresso in centrale per attrezzature', 'Richiesta di ingresso in centrale per dipendenti, mezzi e attrezzature ', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 7, 5,'Denuncia enti previdenziali', 'Copia della documentazione di avvenuta denuncia agli Enti previdenziali, assicurativi ed infortunistici concernente il contratto in oggetto, come previsto all art. 105 - comma 9 – D.Lgs 50/2016', '');
-- INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 8, 5,'Indirizzo mail appaltatore', 'Comunicazione del Vs. indirizzo di posta elettronica (e-mail), con esplicito consenso all’utilizzo di tale mezzo da parte di Enel per inoltrarVi le varie comunicazioni/documentazioni che si renderanno necessari.', '');
-- inserimento documenti comuni anagraf. forn/contr doc salute e sicurezza
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 9, 2,'Dichiar. requisiti luoghi confinati', 'In caso di attività lavorative in ambienti sospetti di inquinamento o confinati: Dichiarazione firmata dal Rappresentante Legale ai sensi dell’art. 47 del DPR 445/2000 di essere in possesso di tutti i requisiti previsti per l’esecuzione delle attività di cui all’art 2 del DPR. 177/2011. Alla dichiarazione allegare le attestazioni, firmate dai lavoratori, dell’avvenuta attività informative, formative e di addestramento', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 10, 2,'Elenco sostanze chimiche', 'Elenco delle sostanze chimiche eventualmente utilizzate in cantiere e relative Schede di Sicurezza; le sostanze sono soggette ad autorizzazione in conformità alle procedure vigenti nelle UB.', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 11, 2,'DVRI programmatico', 'DVRI programmatico con Timbro e firma dell’appaltatore/subappaltatore; nel caso di RTI – Consorzio -  subappalto timbro e firma di ciascuna impresa a seguito della condivisione del DUVRI ed elaborazione delle “Misure di protezione e prevenzione per la riduzione del rischio di interferenza dei lavoratori dell’RTI (o Consorzio e/o subappaltatori)', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 12, 2,'Dichiar. per imprese famigliari e lavoratori autonomi', 'Nel caso di imprese familiari e lavoratori autonomi integrale e vincolante applicazione del comma 2 art. 21 DLgs 81/08.', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 13, 6,'Dichiar. in materia di salute e sicurezza sul lavoro', 'Dichiarazione firmata dal Legale Rappresentante ai sensi dell’art. 47 del DPR 445/2000 attestante: - Che i propri dipendenti sono stati formati ed informati sui rischi specifici connessi alle attività oggetto dell’Appalto conformemente a quanto previsto dall’art 36 D.Lgs 81/08 e s.m.i.', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 14, 6,'Documento di valutazione dei rischi per le specifiche attività oggetto dell appalto', 'Documento di valutazione dei rischi per le specifiche attività oggetto del appalto/subappalto, redatto dall’appaltatore/subappaltatore ai sensi dell’art. 17, comma 1 lettera a, ed art 28 del D.Lgs. 81/08, che vale anche in ottemperanza all’art. 105 - comma 17 – del D.Lgs 50/2016 (ovvero Piano Operativo di sicurezza qualora le attività siano svolte ai sensi del Titolo IV del D.Lgs 81/08); ', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 15, 6,'Elenco dei lavoratori da impiegare per le attività oggetto dell appalto', 'Elenco dei lavoratori da impiegare per le attività e relativa idoneità sanitaria (nel caso di attività in luoghi confinati il medico competente dovrà valutare tale fattore di rischio riportandolo sull’idoneità sanitaria) – Compilare allegato 3 e allegare copia delle singole idoneità sanitarie.', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 16, 6,'Piano di sicurezza per l accesso e la permaneneza delle persone nei luoghi confinati', 'In caso di attività lavorative in ambienti sospetti di inquinamento o confinati: Piano di sicurezza per l’accesso e la permanenza delle persone nei luoghi confinati redatto in relazione alle specifiche attività oggetto dell’appalto/subappalto', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 17, 6,'Dichiarazione ed attestato di sopralluogo preventivo', 'Dichiarazione ed attestato di sopralluogo preventivo (trasmettere copia “Allegato F” se sottoscritto in fase di gara, oppure da redigersi in occasione del primo accesso in impianto) con timbro e firma del appaltatore/subappaltatore; nel caso di ATI – Consorzio -  subappalto, dichiarazione ed attestato di sopralluogo preventivo con timbro e firma di ciascuna impresa.', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 18, 6,'Tabella riepilogativa requisiti attestazioni in possesso dei dipendenti', 'Compilare a cura appaltatore/subappaltatore, Tabulato riepilogativo - file Excel - Requisiti e attestazioni in possesso dei dipendenti', '');

-- inserimento documenti comuni anagraf. forn/contr doc personale
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 19, 4,'Copia libro matricola', 'Copia del libro matricola (completo della parte destra) o copia del Libro Unico del Lavoro per la parte che riguarda qualifica e date di assunzione e scadenza contratto individuale, UNILAV.', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 20, 4,'Documento di identità', 'Scansione leggibile di un documento di identità', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 21, 4,'Fototessera', 'Foto formato tessera (o scansione a colori della tessera di riconoscimento) in formato JPEG per l’emissione del cartellino di ingresso.', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 22, 4,'Permesso di soggiorno', 'Per i lavoratori extracomunitari, fotocopia leggibile del permesso di soggiorno', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 23, 4,'Dichiarazione contratto collettivo del lavoratore', 'Dichiarazione relativa al contratto collettivo applicato ai lavoratori dipendenti.', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 24, 4,'Registro corso di informazione rischi specifici appalto', 'Registro riportante che i propri dipendenti sono stati formati ed informati sui rischi specifici connessi alle attività oggetto dell’Appalto conformemente a quanto previsto dall’art 36 D.Lgs 81/08 e s.m.i. (Alla dichiarazione dovranno essere allegati gli attestati (registri) dei corsi effettuati riportante la firma dei lavoratori)', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 25, 4,'Registro elenco DPI forniti al lavoratore e relativa formazione all utilizzo', 'Registro riportante che i lavoratori sono stati dotati e formati sull’utilizzo dei DPI. (Alla dichiarazione allegare l’elenco dei dispositivi di protezione individuali forniti ai lavoratori e le attestazioni, firmate dagli stessi, dei DPI ricevuti);', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 26, 4,'Idoneità sanitaria', 'Idoneità sanitaria con scadenza', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 27, 4,'Attestato di formazione lavoratore come previsto dall art. 37 DL 81/08 smi e accordo stato regioni vigente in materia', 'Attestato di formazione del lavoratore come previsto dall’art. 37 del D.Lgs. 81/08. Tale formazione deve essere erogata da soggetti formatori abilitati ed avere durata, indirizzi e requisiti minimi come prescritto dall’Accordo Stato Regioni vigente in materia.', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 28, 4,'Contratto', 'Tipologia di contratto', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 29, 4,'Contratto a tempo determinato', 'Se tempo determinato, inserire scadenza', '');
-- INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 30, 4,'Contratto a tempo determinato', 'Se tempo determinato, inserire scadenza', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 31, 4,'Contratto di distacco: Comunicazione impresa', 'Comunicazione formale dell impresa appaltatrice ad Enel di volersi avvalere di personale in distacco temporaneo da altra impresa, con specificazione dell impresa distaccante e delle generalità del personale distaccato;', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 32, 4,'Contratto di distacco: Dichiarazione distaccante', 'Dichiarazione dell impresa distaccante contenente l indicazione dell impresa beneficiaria del distacco, delle generalità del personale distaccato, della temporaneità del distacco e delle attività cui è destinato il personale distaccato;', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 33, 4,'Contratto di distacco: DURC', 'Certificazione che attesti la regolarità contributiva dell impresa distaccante (Durc)', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 34, 4,'Contratto di distacco: Accettazione distacco', 'Accettazione del lavoratore distaccato in merito a quanto concordato tra impresa cedente e impresa ricevente', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 35, 4,'Contratto di distacco: Copia libro matricola', 'Copia Libro Unico del Lavoro del personale distaccato', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 39, 4,'Formazione e addestarmento per l utilizzo di DPI di III categoria', 'Formazione e addestarmento per l utilizzo di DPI di III categoria', '');

-- inserimento documenti comuni anagraf. forn/contr doc mezzi
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 36, 7,'Certificato di assicurazione', 'Polizza assicurativa con quietanza di pagamento', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 37, 7,'Carta di circolazione', 'Libretto di circolazione con scadenza revizione', '');
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 38, 7,'Documentazione obbligatoria di conformità alle disposizioni dell 81/08', 'Ultimo verbale di verifica periodica in corso di validità, documentazione CE di conformità, libretti e certificati ex ISPSEL', '');
 
-- inserimento documenti comuni anagraf. forn/contr doc attrezzature
INSERT INTO "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" VALUES( 40, 8,'Attrezzature di lavoro introdotte in CTE "Speciali" ', 'Specifica documentazione attestante la conformità alle disposizioni del D.Lgs. 81/08, di mezzi trasporto e movimentazione materiali, sollevamento, piattaforme aeree, ponti mobili sviluppabili, macchine operatrici, attrezzature in genere e opere provvisionali; (dichiarazioni CE di conformità, libretti e certificati ex ISPESL, per tutti i mezzi di trasporto e sollevamento con targa, fotocopia leggibile della carta di circolazione completa, della polizza assicurativa con quietanza di pagamento, ultimo verbale di verifica periodica in corso di validità).Tutta la documentazione inerente il macchinario/attrezzatura dovrà esser a disposizione presso il cantiere.', '');

-- REL_UB_TO_AFNAM
INSERT INTO "CONTRACT_MANAGEMENT"."REL_UB_TO_AFNAM" VALUES(1,'I_C_FS','UB Fusina','COAL - FUSINA','ITFS','FS00-C.le TH Fusina');

-- REL_USER_UB
-- ------ Test Users
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A020934',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A242171',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A243781',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A256198',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A260492',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A261545',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A262352',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A263036',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A263841',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A264062',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A320276',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A324896',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A435526',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A444589',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A454644',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A455563',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A460790',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A464722',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'A699499',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'AE102501',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'AE120051',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'AE120052',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'AE120053',1);
-- INSERT INTO "CONTRACT_MANAGEMENT"."REL_USER_UB" VALUES(1,'AE99737',1);
-- ------ End Test Users
-- Stati RA giornalieri
INSERT INTO "CONTRACT_MANAGEMENT"."RA_DAILY_STATES_T" VALUES(0,'IT','Nessun RA ancora compilato');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_DAILY_STATES_T" VALUES(1,'IT','RA in bozza e non inviato');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_DAILY_STATES_T" VALUES(2,'IT','RA compilato ed inviato al CS');

--Stati pos. OdM RA
INSERT INTO "CONTRACT_MANAGEMENT"."RA_DAILY_ODMOP_STATES_T" VALUES(0,'IT','Non compilato');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_DAILY_ODMOP_STATES_T" VALUES(1,'IT','Compilato');		
INSERT INTO "CONTRACT_MANAGEMENT"."RA_DAILY_ODMOP_STATES_T" VALUES(2,'IT','Compilato e chiuso');

INSERT INTO "CONTRACT_MANAGEMENT"."APPROVAL_STATUS" VALUES(1,1);
INSERT INTO "CONTRACT_MANAGEMENT"."APPROVAL_STATUS" VALUES(2,2);

INSERT INTO "CONTRACT_MANAGEMENT"."APPROVAL_STATUS_T" VALUES(1,'IT', 'Accettato');
INSERT INTO "CONTRACT_MANAGEMENT"."APPROVAL_STATUS_T" VALUES(2,'IT', 'Accettato con riserva');

INSERT INTO "CONTRACT_MANAGEMENT"."RA_DAILY_ODMOP_STATES_T" VALUES(3,'IT','Accettato');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_DAILY_ODMOP_STATES_T" VALUES(4,'IT','Accettato con riserva');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_DAILY_ODMOP_STATES_T" VALUES(5,'IT','Bozza copiata da RA');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_DAILY_ODMOP_STATES_T" VALUES(6,'IT','Compilato');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_DAILY_ODMOP_STATES_T" VALUES(7,'IT','Bozza');

INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_CONS_COMMON" VALUES(1,'Fornitura di materiali a seguito fattura','',null,null,null,'EUR', '');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_CONS_COMMON" VALUES(2,'Noleggi a caldo di attrezzature','',null,null,null,'EUR', '');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_CONS_COMMON" VALUES(3,'Noleggi a caldo di macchine','',null,null,null,'EUR', '');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_CONS_COMMON" VALUES(4,'Noleggi a freddo di attrezzature','',null,null,null,'EUR', '');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_CONS_COMMON" VALUES(5,'Noleggio a freddo di macchinari','',null,null,null,'EUR', '');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_CONS_COMMON" VALUES(6,'Prestazioni di manodopera','',null,null,null,'EUR', '');

INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_UM" VALUES('G.','Giorni');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_UM" VALUES('H','Ora');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_UM" VALUES('KG','Chilogrammo');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_UM" VALUES('L','Litri');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_UM" VALUES('M','Metro');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_UM" VALUES('M2','Metro quadro');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_UM" VALUES('M3','Metro cubo');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_UM" VALUES('NUM','Numero');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_UM" VALUES('Q','Quintale');
INSERT INTO "CONTRACT_MANAGEMENT"."RA_ACCOUNTING_UM" VALUES('T','Tonnellata');