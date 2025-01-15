from email.policy import default

from odoo import api, fields, models
from odoo.api import returns


class HelpTicket(models.Model):
    _name = 'help.ticket'
    _description = " Cloud Help Ticket"
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _rec_name = 'display_name'

    name = fields.Char(string="Subject", required=True, tracking=True)
    partner_id = fields.Many2one('res.partner', string="Customer")
    user_id = fields.Many2one('res.users', string='Assigned To')
    email = fields.Char(string="Email")
    partner_phone = fields.Char(string='Phone', size=32)
    ticket_type_id = fields.Many2one('helpticket.type', string='Type')
    priority = fields.Selection([('0','Low'),
                                 ('1','Medium'),
                                 ('2', 'High'),
                                 ('3', 'Very High')], string="Priority", default='0', tracking=True)
    tag_ids = fields.Many2many('helpticket.tags', string="Tag", help="Provide appropriate tags for this Ticket", default=lambda self: self.env['helpticket.tags'].browse([]))
    image = fields.Image()
    description = fields.Text(string="Description", help="Provide a detailed description of the ticket.")
    state = fields.Selection([('new', 'New'),
                              ('resource_allocation', 'Resource Allocation'),
                              ('in_progress', 'In progress'),
                              ('solved', 'Solved'),
                              ('verified', 'Verified'),
                              ('cancelled', 'Cancelled')],
                             default='new')
    display_name = fields.Char(
        string="Display Name",
        compute="_compute_display_name",
        store=True
    )
    website = fields.Boolean(default=False)


    @api.model
    
    def get_user_partner(self, user_id):
        user = self.env['res.users'].search([('id', '=', user_id)], limit=1)

        if user:
            records = self.env['help.ticket'].search_read(
                [('partner_id', '=', user.partner_id.id), ('website', '=', True)],
                ['id', 'name', 'partner_id']
            )
            return records
        else:
            return []
            
     @api.model
    
    def get_user_partner(self, user_id):
        user = self.env['res.users'].search([('id', '=', user_id)], limit=1)

        if user:
            records = self.env['help.ticket'].search_read(
                [('partner_id', '=', user.partner_id.id), ('website', '=', True)],
                ['id', 'name', 'partner_id']
            )
            return records
        else:
            return []

    @api.depends('name')
    def _compute_display_name(self):
        for record in self:
            record.display_name = f"{record.name or 'New'} (#{record.id or ''})"
