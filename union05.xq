declare function local:printBook($book as node()) as node()
{
    <libro isbn="{$book/@isbn}" >
    {$book/titulo}
    {doc("editorial.xml")//editorial[./@codigo = $book/editorial/@codigo]}
    <ediciones>
        {$book//edicion}
    </ediciones>
    {$book//autores}
    {$book//tema}
    </libro>
};
<libros>
<!-- expected only two books by assignment, in other case it could be a collection -->
{local:printBook(doc("libro01.xml")/libro)}
{local:printBook(doc("libro02.xml")/libro)}
</libros>