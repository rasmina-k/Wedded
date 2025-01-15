from odoo import fields, models



class HelpTicketType(models.Model):
    _name = 'helpticket.type'
    _description = " Cloud Help Ticket Types"
    _rec_name = 'name'

    name = fields.Char(string="Name", required=True)

