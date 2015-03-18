<?php echo validation_errors('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>', '</div>'); ?>
    
<form class="form-horizontal" method="post" action="<?php echo base_url('task/save'); ?>">
    <fieldset>
        <div class="row-fluid">
            <div class="span12">
                <div class="control-group">
                    <label class="control-label" for="title">Titulo *</label>
                    <div class="controls">
                        <input type="text" class="input-xxlarge" name="title" id="title" maxlength="50"
                               placeholder="Title" value="<?php echo set_value('title', $title); ?>" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="control-group">
                    <label class="control-label" for="parent_id">Dependência</label>
                    <div class="controls">
                        <?php
                        $options = array();
                        $options[0] = '- None -';
                        foreach ($tasks as $value) {
                            $options[$value['id']] = $value['title'];
                        }
                        echo form_dropdown('parent_id', $options, set_value('parent_id', $parent_id), 'class="input-xxlarge"');
                        ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="control-group">
                    <label class="control-label" for="priority">Prioridade</label>
                    <div class="controls">
                        <?php $options = task_priority_text();
                              echo form_dropdown('priority', $options, set_value('priority', $priority), 'class="input-xxlarge"'); ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="control-group">
                    <label class="control-label" for="description">Descrição Sumária *</label>
                    <div class="controls">
                        <textarea name="description" id="description" class="input-xxlarge" rows="6"><?php echo set_value('description', $description); ?></textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="control-group">
                    <label class="control-label" for="user_id">Tarefa Designada Para</label>
                    <div class="controls">
                        <?php
                        $options = array();
                        foreach ($users as $value) {
                            $options[$value['id']] = $value['email'];
                        }
                        echo form_dropdown('user_id', $options, set_value('user_id', $user_id), 'class="input-xxlarge"');
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
    <fieldset>
        <legend>Informações Adicionais</legend>
        <div class="row-fluid">
            <div class="span12">
                <div class="control-group">
                    <label class="control-label" for="due_date">Data de Vencimento</label>
                    <div class="controls">
                            <div class="input-append">
                                <input type="text" name="due_date" id="due_date" class="datepicker" value="<?php echo set_value('due_date', $due_date); ?>">
                                <a href="#" title="Select date" class="btn datepicker-action">
                                    <i class="icon-calendar"></i>
                                </a>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
    <hr/>

    <?php if (isset($task_id)) echo form_hidden('task_id', $task_id); ?>
    <?php if (isset($status)) echo form_hidden('status', $status); ?>
    <?php if (isset($project_id)) echo form_hidden('project_id', $project_id); ?>
    
    <div class="btn-group btn-center">
        <button type="submit" name="save" class="btn btn-success">
            <i class="icon-white icon-ok"></i>
            Salvar
        </button>
        <button type="submit" name="cancel" class="btn btn-warning">
            <i class="icon-white icon-remove"></i>
            Cancelar
        </button>
        <?php if(isset($task_id)) : ?>
        <a href="<?php echo base_url('task/remove/'.$project_id.'/'.$task_id); ?>" class="btn btn-danger remove-item-action">
            <i class="icon-white icon-remove"></i>
            Remover
        </a>
        <?php endif; ?>
    </div>

</form>
