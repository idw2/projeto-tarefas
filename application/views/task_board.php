<?php if(isset($stories) || isset($tasks) || isset($tests) || isset($done)) { ?>
<table class="table">
    <tr>
        <th width="25%">Para Fazer</th>
        <th width="25%">Em Andamento</th>
        <th width="25%">Testando</th>
        <th width="25%">Feito</th>
    </tr>
    <tr>
        <td>
            <?php
            if(isset($stories)) {
                $i = 0;
                foreach ($stories as $value) {
                    $i++;
                    $this->load->view('templates/single_task', array('i' => $i, 'project' => $project_id, 'task' => $value));
                }
            }
            ?>
        </td>
        <td>
            <?php
            if(isset($tasks)) {
                $i = 0;
                foreach ($tasks as $value) {
                    $i++;
                    $this->load->view('templates/single_task', array('i' => $i, 'project' => $project_id, 'task' => $value));
                }
            }
            ?>
        </td>
        <td>
            <?php
            if(isset($tests)) {
                $i = 0;
                foreach ($tests as $value) {
                    $i++;
                    $this->load->view('templates/single_task', array('i' => $i, 'project' => $project_id, 'task' => $value));
                }
            }
            ?>
        </td>
        <td>
            <?php
            if(isset($done)) {
                $i = 0;
                foreach ($done as $value) {
                    $i++;
                    $this->load->view('templates/single_task', array('i' => $i, 'project' => $project_id, 'task' => $value));
                }
            }
            ?>
        </td>
    </tr>

</table>
<?php } else { ?>
<div class="alert">Este projeto não possui tarefas.</div>
<?php } ?>