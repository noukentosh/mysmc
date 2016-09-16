<table class="highlight pointer">
    <thead>
        <th>Заголовок</th>
        <th>Дата</th>
    </thead>
    <tbody>
        {foreach $data as $article}
        <tr onclick="selectedModule('article'); selectedContent({$article.id});">
            <td>{$article.title}</td>
            <td>{$article.date}</td>
        </tr>
        {/foreach}
    </tbody>
</table>