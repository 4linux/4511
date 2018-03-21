define :users_setup do
  user 'helpdesk' do
    action :create
    comment 'HelpDesk'
    home '/home/helpdesk'
    shell '/bin/bash'
    password '$1$ZJ4HVScg$uuddVUdmBk12AxM6Qmrf5/'
  end
  user 'devops' do
    action :create
    comment 'DevOps'
    home '/home/devops'
    shell '/bin/bash'
    password '$1$ZJ4HVScg$uuddVUdmBk12AxM6Qmrf5/'
  end
end
