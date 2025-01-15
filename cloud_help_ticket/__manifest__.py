{
    'name': 'Cloud Help Ticket',
    'version': '17.0.1.0.0',
    'category': 'Extra Tools',
    'summary': """This module is used to manage the Cloud Help Ticket of Cyllo""",
    'description': """This module is used to manage the Cloud Help Ticket of Cyllo""",
    'author': 'Cybrosys Techno Solutions',
    'company': 'Cybrosys Techno Solutions',
    'maintainer': 'Cybrosys Techno Solutions',
    'website': 'https://www.cybrosys.com',
    'depends': ['base', 'website', 'base_automation', 'portal'],
    'data': [
        'security/ir.model.access.csv',
        'views/help_ticket_views.xml',
        'views/helpticket_tags_views.xml',
        'views/helpticket_type_views.xml',
        'views/help_ticket_request_template.xml',
        'views/help_ticket_menu.xml',

    ],
    'assets': {
            'web.assets_frontend': [
                "/cloud_help_ticket/static/src/css/help_ticket_request.css",
            ]
    },
    'license': 'LGPL-3',
    'installable': True,
    'auto_install': True,
    'application': True,
}
