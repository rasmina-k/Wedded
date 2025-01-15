from odoo import fields, models
from random import randint



class HelpTicketTags(models.Model):
    _name = 'helpticket.tags'
    _description = " Cloud Help Ticket Tags"
    _rec_name = 'name'

    def _get_default_color(self):
        return randint(1, 11)

    name = fields.Char(string="Name", required=True)
    color = fields.Integer(string="Colour", default=_get_default_color)

    _sql_constraints = [
        ('name_uniq', 'unique (name)', "Tag name already exists!"),
    ]

