<?php if(isset($users)) { ?>
    <table class="table table-bordered table-striped">
        <tr>
            <th>ID</th>
            <th>E-mail</th>
            <th class="hidden-phone">Nível</th>
            <th class="hidden-phone">Data de Criação</th>
            <th>Ações</th>
        </tr>
    <?php foreach ($users as $user) { ?>
        <tr id="user_<?php echo $user['id']; ?>">
            <td><?php echo $user['id']; ?></td>
            <td><?php echo anchor('profile/view/'.$user['id'], $user['email'], 'class="view-profile-details"'); ?></td>
            <td class="hidden-phone"><?php echo $level_list[$user['level']]; ?></td>
            <td class="hidden-phone"><?php echo date("j/M/Y, g:i a", strtotime($user['date_created'])); ?></td>
            <td>
                <a href="<?php echo base_url('user/edit/'.$user['id']); ?>"
                   class="btn btn-mini"
                   title="Editar">
                    <i class="icon-edit"></i>
                </a>
                <a href="<?php echo base_url('user/remove/'.$user['id']); ?>"
                   class="btn btn-mini btn-danger remove-item-action"
                   title="Remover">
                    <i class="icon-remove"></i>
                </a>
            </td>
        </tr>
    <?php } ?>
    </table>
<?php } else { ?>
    <div class="alert">No users registered.</div>
<?php } ?>

