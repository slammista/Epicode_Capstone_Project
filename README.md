# Epicode_Capstone_Project
Capstone Project by Matteo Aslam

Ciao a tutti!
In questo progetto ho creato una dashboard per un nuovo cliente.

*Contesto*

Il cliente vuole lanciare un nuovo progetto dopo la decadenza del precedente; 
partito nel 2006 da una piccola impresa è arrivato ad avere un buon numero di dipendenti, l'azienda sembrava in fase di crescita ma avuto una decrescita nel giro di pochi anni e il cliente non sa spiegarsi il perché.

Nella fase di richiesta dei requisiti ho quindi chiesto cosa volesse vedere dei dati di questa vecchia azienda.

Mi ha chiesto di creare una dashboard che desse un'overview sulla situazione dei dipendenti,  una parte demografica e una parte per il motivo del termine del rapporto lavorativo, andando a cercare di scoprire perché non si sono trovati bene.

Ho chiesto dove potevo reperire dati sulla vecchia azienda e mi ha fornito un file di testo dove all'interno c'erano già tutti i dati che gli interessavano.

*Fase di preparazione dei dati*

Sono partito da file HRDatasetV14.csv che al suo interno conteneva numerose colonne che potevano essere riorganizzate in un database (più comodo di un csv).

Dopo essermi fatto un'idea con un Diagramma ER disegnato a mano, ho iniziato con la creazione del database, l'importazione del csv (Table Data Import Wizard) e un primo "SELECT * FROM hr;" per controllare che il csv fosse stato importato correttamente e per un primo sguardo al database.

Dopo aver fatto vari passaggi di pulizia di dati che contenevano errori di battitura, ho generato le tabelle ridistribuendo le colonne in 8 tabelle su mysql partendo dalla tabella dei fatti che sarà "employee_performances" e le sue dimensioni employee, maritalstatus, position, manager (come mostrate nel modello dati).

Una volta fatto questo ho chiuso mysql, ho aperto powerbi desktop e tramite il connettore di mysql ho importato tutte le tabelle con Power Query.

Avendo ora tutto il mio database connesso ho creato una nuova tabella Calendar per le dimensioni Data dopo di ché ho proceduto con le visualizzazioni dati.

Dopo aver scelto una palette adatta per il tipo di pubblico a cui andrò a proporre la dashboard, ho pubblicato il report su PowerBI Service dal quale poi ho proceduto con la creazione dell'app accessibile.

Troviamo nella pagina overview un sunto di quella che è la situazione dell'azienda che può essere già approfondita tramite i due slicer in alto per il dipartimento e per l'anno.


*Fase di analisi*

Cosa notiamo dai dati?

- Abbiamo una leggera prevalenza di donne rispetto agli uomini.
- Il 77% degli employee performa secondo tutti gli standard.
- Circa il 60% dei dipendenti è nella fascia di età compresa tra i 35 e i 45 anni.
- Il marital status degli employee è caratterizzato principalmente da Single (43%) e Married (42%)
- Abbiamo una presenza maggiore di persone di razza Bianca/Caucasica ma lo stipendio medio più alto appartiene a un gruppo di persone di razza ispanica.
- Abbiamo il maggior numero di dipendenti nel 2011.
- Il 34% dei dipendenti totali ha lasciato l'azienda.
- Nonostante il numero di dipendenti che ha lasciato l'azienda, solo il 3-4% dei dipendenti si è dimostrato scontento nelle survey sulla soddisfazione in azienda.
- Il dipartimento dove c'è maggiore termine del rapporto lavorativo è Production.
- Le motivazioni principali per l'abbandono del rapporto lavorativo sono l'infelicità dei dipendenti o l'aver ricevuto una nuova proposta di lavoro.



*Conclusioni*

Da questi dati possiamo notare che c'è stata una diminuzione dei dipendenti causata principalmente da infelicità e nuove offerte di lavoro che hanno portato alla diminuzione drastica della forza lavoro nell'azienda.

Suggerimenti: proporre stipendi più alti, proporre benefit, proporre work-life balance maggiore, formazione e cura dell'ambito production, campagne di assunzione basate sulla diversity, equity, inclusion.
