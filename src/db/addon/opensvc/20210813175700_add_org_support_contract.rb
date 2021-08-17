class AddOrgSupportContract < ActiveRecord::Migration[5.2]
  def self.up
    ObjectManager::Attribute.add(
      object:        'Organization',
      name:          'support_contract',
      display:       'Support Contract',
      data_type:     'select',
      data_option:   {
        default: 'none',
        options: {
          'none' => 'Best Effort',
          'standard' => 'Standard',
          'premium' => 'Premium',
        },
        null:    true,
      },
      active:        true,
      screens:       {
        view: {
          'ticket.customer': { 'shown' => true },
          'ticket.agent': { 'shown' => true },
          'admin.organization': { 'shown' => true },
        },
        create: {
          'ticket.agent': { 'shown' => true, 'required' => false },
          'admin.organization': { 'shown' => true, 'required' => false },
        },
        edit: {
          'ticket.agent': { 'shown' => true, 'required' => false },
          'admin.organization': { 'shown' => true, 'required' => false },
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
      object: 'Organization',
      name:   'support_contract',
    )
    ObjectManager::Attribute.migration_execute
  end
end
