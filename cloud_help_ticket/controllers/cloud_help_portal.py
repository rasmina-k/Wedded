# -*- coding: utf-8 -*-
from odoo import http
from odoo.http import request


class HelpTicketPortal(http.Controller):
    """Class for Help Ticket Portal Management"""

    @http.route(['/help_ticket'], type='http', auth="user", website=True, csrf=False)
    def get_help_ticket_request(self):
        """Display Help Tickets with filtering and sorting options"""
        tickets = request.env['help.ticket'].sudo().search([
            ('partner_id', '=', request.env.user.partner_id.id)
        ])

        in_progress_tickets = tickets.filtered(lambda r: r.state == 'in_progress')
        solved_tickets = tickets.filtered(lambda r: r.state == 'solved')
        verified_tickets = tickets.filtered(lambda r: r.state == 'verified')

        values = {
            'help_tickets': tickets,
            'page_name': 'help_ticket',
            'help_ticket_request_count': len(tickets),
            'in_progress_tickets': in_progress_tickets,
            'in_progress_tickets_count': len(in_progress_tickets),
            'solved_tickets': solved_tickets,
            'solved_tickets_count': len(solved_tickets),
            'verified_tickets': verified_tickets,
            'verified_tickets_count': len(verified_tickets),
        }
        return request.render("cloud_help_ticket.cloud_help_tickets_template", values)

    @http.route('/help_ticket/details/<int:ticket_id>', type='http', auth='user', website=True)
    def get_ticket_details(self, ticket_id, **kwargs):
        ticket = request.env['help.ticket'].browse(ticket_id)
        print('ticket111111111',ticket)
        if not ticket.exists():
            return request.render('website.404')
        return request.render('cloud_help_ticket.cloud_help_ticket_details', {
            'ticket': ticket,
            'page_name': 'help_ticket_details',

        })