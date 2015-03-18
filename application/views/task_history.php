<h2><?php echo $title; ?></h2>
<table class="table table-bordered table-striped">
        <tr>
            <th>Fase</th>
            <th>Usuário</th>
            <th>Iniciado</th>
            <th>Finalizado</th>
            <th>Duração</th>
        </tr>
<?php foreach ($task_history as $value) { ?>
    <tr>
        <td><?php echo $status_arr[$value['status']]; ?></td>
        <td><?php echo ($value['email'])?$value['email']:'-'; ?></td>
        <td><?php echo $value['date_created']; ?></td>
        <td><?php echo ($value['date_finished'])?$value['date_finished']:'-'; ?></td>
        <td><?php echo ($value['duration']?timespan_diff($value['duration']):''); ?></td>
    </tr>
<?php } ?>
</table>
