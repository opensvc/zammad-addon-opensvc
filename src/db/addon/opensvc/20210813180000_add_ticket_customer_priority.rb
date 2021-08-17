class AddTicketCustomerPriority < ActiveRecord::Migration[5.2]
  def self.up
    ObjectManager::Attribute.add(
      object:        'Ticket',
      name:          'customer_priority',
      display:       'Customer Priority',
      data_type:     'tree_select',
      data_option:   {
        default: 'P3 [Normal]',
        options: [
          {
          'name' => 'P1 [Critical - Premium Support Contracts]',
          'value' => 'P1 [Critical - Premium Support Contracts]',
          'children' =>
            [
              {
                'name' => 'P1 [Critical - Phone Callback]',
                'value' => 'P1 [Critical - Premium Support Contracts]::P1 [Critical - Phone Callback]'
              },
              {
                'name' => 'P1 [Critical - Email/Slack/Web]',
                'value' => 'P1 [Critical - Premium Support Contracts]::P1 [Critical - Email/Slack/Web]'
              },
            ]
          },
          {
            'name' => 'P2 [High]',
            'value' => 'P2 [High]',
          },
          {
            'name' => 'P3 [Normal]',
            'value' => 'P3 [Normal]',
          },
          {
            'name' => 'P4 [Low]',
            'value' => 'P4 [Low]',
          },
        ],
        null:    true,
      },
      active:        true,
      screens:       {
        create_middle: {
          'ticket.customer': { 'shown' => true, 'required' => false, 'item_class' => 'column' },
          'ticket.agent': { 'shown' => true, 'required' => false, 'item_class' => 'column' },
        }, 
        edit: {
          'ticket.customer': { 'shown' => true, 'required' => false },
          'ticket.agent': { 'shown' => true, 'required' => false },
        }, 
      },
      position:      1550,
      created_by_id: 1,
      updated_by_id: 1,
    )
    ObjectManager::Attribute.migration_execute
  end

  def self.down
    ObjectManager::Attribute.remove(
      object: 'Ticket',
      name:   'customer_priority',
    )
    ObjectManager::Attribute.migration_execute
  end
end
