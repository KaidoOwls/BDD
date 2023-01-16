/*1*/SELECT numfou,qte1,qte2,qte3
FROM vente
WHERE numfou = '9120';


/*2*/SELECT numfou,numcom
FROM entcom;


/*3*/SELECT numfou, COUNT(numfou) "nb de commandes"
FROM entcom
GROUP BY numfou;

select count(distinct  numfou) "nb fournisseur", count(numcom) "nb de commandes"
FROM entcom;


/*4*/select codart,libart, stkale,stkphy,qteann
FROM produit
WHERE stkphy <= stkale AND qteann <1000;


/*5*/SELECT posfou,nomfou
FROM fournis
WHERE posfou LIKE '75%' OR posfou LIKE '78%' OR posfou LIKE '92%' OR posfou LIKE '77%'
order by posfou desc, nomfou asc;


/*6*/SELECT numcom,datcom 
FROM entcom
WHERE MONTH(datcom) = 03 OR MONTH(datcom) = 04;

select numcom, datcom 
from entcom
where datcom like "%-03-%" or datcom like "%-04-%";


/*7*/select numcom , obscom , datcom 
from entcom
where obscom <> "";

/*SELECT numcom,obscom, datcom
FROM entcom
WHERE obscom is not null;*/


/*8*/select numcom, sum(qtecde)  
from ligcom
group by numcom 
order by sum(qtecde)  desc;


/*9*/select numcom, sum(qtecde * priuni) as "total" 
from ligcom
where qtecde < 1000
group by numcom 
having  total > 10000
/*COMPREND RIEN AU HAVING*/


/*10*/select fournis.nomfou, ligcom.numcom, entcom.datcom  
from fournis
join entcom on entcom.numfou = fournis.numfou 
join ligcom on ligcom.numcom = entcom.numcom
group by numcom; 


/*11*/select entcom.numcom, fournis.numfou, produit.libart, entcom.obscom, ligcom.qtecde, ligcom.priuni, (ligcom.qtecde * ligcom.priuni) as total
from fournis
join entcom on entcom.numfou = fournis.numfou 
join ligcom on ligcom.numcom = entcom.numcom
join produit on produit.codart = ligcom.codart 
where entcom.obscom like  "%urgent%" 
order by total asc;


/*12*//*select numfou  
from entcom;

select numfou
from vente
group by numfou;
 
/*13*/
select numfou, numcom, datcom
from entcom
where numfou  in  (select numfou  
    from entcom
    where numcom = 70210
)    ;
    

select distinct fournis.nomfou
from fournis 
join vente on fournis.numfou = vente.numfou 
join produit on vente.codart = produit.codart 
join ligcom on produit.codart = ligcom.codart
where qtecde > qteliv and stkphy > 0 /*(qtecde - qteliv)*/


select distinct nomfou
from fournis 
where numfou in (
    select numfou
    from vente 
    where codart in (
        select distinct codart
        from ligcom
        where qtecde > qteliv)
    )



select *
from entcom
where numfou IN (
    select numfou
    from entcom
    where numcom = 70210
)

