<table class="highlight pointer">
    <thead>
        <th>Заголовок</th>
        <th>Дата</th>
    </thead>
    <tbody>
        {foreach $data as $news}
        <tr onclick="selectedContent({$news.id})">
            <td>{$news.title}</td>
            <td>{$news.date}</td>
        </tr>
        {/foreach}
    </tbody>
</table>