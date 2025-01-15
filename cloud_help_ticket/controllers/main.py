# -*- coding: utf-8 -*-
from odoo import http
from odoo.http import request
from odoo.addons.portal.controllers.portal import CustomerPortal


class HelpTicketPortal(CustomerPortal):
    """Class to define the portal views for Help Tickets."""

    def _prepare_home_portal_values(self, counters):
        """Retrieve the count of total number of help tickets."""
        values = super()._prepare_home_portal_values(counters)
        if 'help_ticket_request_count' in counters:
            tickets = request.env['help.ticket'].sudo().search(
                [('partner_id', '=', request.env.user.partner_id.id)]
            )
            values['help_ticket_request_count'] = len(tickets)
        return values

